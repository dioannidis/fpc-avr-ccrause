program sound;

uses
  intrinsics;

// Note: default CPU clock is internal 8 MHz oscillator with div 8 prescaler
// Note: careful with stack space, there is only 32 bytes RAM. Use at least -O3!
//       5 bytes global variables
//       15 bytes genSound interrupt stack
//       2 bytes return address
//       2 bytes for Sound_xxx stack
//       2 bytes return address
//       26 bytes total
//       So only 6 bytes RAM free, watch out for complex sound functions that uses stack space

type
  TSoundFunction = function(): byte;

var
  t: word;
  SoundSelector: TSoundFunction;
  soundIndex: byte;

function Sound_TwoToneAlarm(): byte;
begin
  result := t*(47 and (t shr 7));
end;

function Sound_PacmanAlarm(): byte;
begin
  result := t*(120 and (t shr 5));
end;

function Sound_DigitalWatchAlarm(): byte;
begin
  result := (t*(64 and (t shr 4) and (t shr 6)));
end;

function Sound_StrangeMelody(): byte;
begin
  result := byte(t*(42 and (t shr 10)));
end;

function Sound_StrangeMelody2(): byte;
begin
  result := byte(t*(41 and (t shr 10)));
end;

function Sound_LaserBattle(): byte;
begin
  if (t and 8192) > 0 then
    result := t shl 2
  else
    result := t xor 203;
  result := result * (t shr 3);
end;

procedure genSound; alias: 'TIM0_OVF_ISR'; interrupt;
begin
  inc(t);
  if t = 0 then
  begin
    inc(soundIndex);
    if soundIndex > 5 then
      soundIndex := 0;

    if soundIndex = 0 then
      SoundSelector := @Sound_StrangeMelody
    else if soundIndex = 1 then
      SoundSelector := @Sound_LaserBattle
    else if soundIndex = 2 then
      SoundSelector := @Sound_DigitalWatchAlarm
    else if soundIndex = 3 then
      SoundSelector := @Sound_StrangeMelody2
    else if soundIndex = 4 then
      SoundSelector := @Sound_PacmanAlarm
    else
      SoundSelector := @Sound_TwoToneAlarm;

    // Delay between samples
    // at -O3 this loop takes 13 cycles, @2 MHz this is an 0.4 s delay
    OCR0AL := 0;  // cancel previous PWM value
    repeat
      inc(t);
    until t = 0;
  end;
  OCR0AL := SoundSelector();
end;

begin
  SoundSelector := @Sound_StrangeMelody;
  soundIndex := 0;
  // Change clock prescaler to 4, 2 MHz clock
  {$ifdef CPUAVRTINY}
  CCP := $D8;
  CLKPSR := 2;  // div 4
  {$endif}
  DDRB := 1 or 2;  // Set PB0, PB1 to output
  TCCR0A := (2 shl COM0A) or (1 shl 0); // WGM mode 5
  TCCR0B := (1 shl 3) or (1 shl CS0);   // clock prescaler = 1, OVF = 2000000/256 = 7812.5 Hz
  OCR0A := 0;
  TIMSK0 := 1 shl TOIE0;
  avr_sei;

  repeat until false;
end.

// avrdude -p t10 -c usbasp -U flash:w:sound.hex:i
//
// USBASP connections
//  ICSP        attiny10        ICSP
//                 __
//  MOSI ---- PB0 |o | RST ---- RST
//  GND  ---- GND |  | Vcc ---- Vcc
//  SCK  ---- PB1 |__| PB2
//

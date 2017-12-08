unit ATtiny11;

{$goto on}


{$bitpacking on}{$packset 1}{$packenum 1}
type
  TBitField = 0..1;

type
  TACSRset = bitpacked set of (e_ACIS0, e_ACIS1, e_ACIE=3, e_ACI, e_ACO, e_ACD=7);
  TACSRrec = bitpacked record
    ACIS0,
    ACIS1,
    ReservedBit2,
    ACIE,
    ACI,
    ACO,
    ReservedBit6,
    ACD: TBitField;
  end;
var
  ACSR: byte absolute $08;  // Analog Comparator Control And Status Register
  ACSRset: TACSRset absolute $08;
  ACSRrec: TACSRrec absolute $08;
const
  ACIS0 = 0;  m_ACIS0 = 1;  // Analog Comparator Interrupt Mode Select bits
  ACIS1 = 1;  m_ACIS1 = 2;  // Analog Comparator Interrupt Mode Select bits
  ACIE = 3;  m_ACIE = 8;  // Analog Comparator Interrupt Enable
  ACI = 4;  m_ACI = 16;  // Analog Comparator Interrupt Flag
  ACO = 5;  m_ACO = 32;  // Analog Comparator Output
  ACD = 7;  m_ACD = 128;  // Analog Comparator Disable

var
  PINB: byte absolute $16;  // Input Pins, Port B
  DDRB: byte absolute $17;  // Data Direction Register, Port B

type
  TPORTBset = bitpacked set of (e_PB0, e_PB1, e_PB2, e_PB3, e_PB4);
  TPORTBrec = bitpacked record
    PB0,
    PB1,
    PB2,
    PB3,
    PB4,
    ReservedBit5,
    ReservedBit6,
    ReservedBit7: TBitField;
  end;
var
  PORTB: byte absolute $18;  // Data Register, Port B
  PORTBset: TPORTBset absolute $18;
  PORTBrec: TPORTBrec absolute $18;
const
  PB0 = 0;  m_PB0 = 1;
  PB1 = 1;  m_PB1 = 2;
  PB2 = 2;  m_PB2 = 4;
  PB3 = 3;  m_PB3 = 8;
  PB4 = 4;  m_PB4 = 16;

type
  TWDTCRset = bitpacked set of (e_WDP0, e_WDP1, e_WDP2, e_WDE, e_WDTOE);
  TWDTCRrec = bitpacked record
    WDP0,
    WDP1,
    WDP2,
    WDE,
    WDTOE,
    ReservedBit5,
    ReservedBit6,
    ReservedBit7: TBitField;
  end;
var
  WDTCR: byte absolute $21;  // Watchdog Timer Control Register
  WDTCRset: TWDTCRset absolute $21;
  WDTCRrec: TWDTCRrec absolute $21;
const
  WDP0 = 0;  m_WDP0 = 1;  // Watch Dog Timer Prescaler bits
  WDP1 = 1;  m_WDP1 = 2;  // Watch Dog Timer Prescaler bits
  WDP2 = 2;  m_WDP2 = 4;  // Watch Dog Timer Prescaler bits
  WDE = 3;  m_WDE = 8;  // Watch Dog Enable
  WDTOE = 4;  m_WDTOE = 16;  // RW

var
  TCNT0: byte absolute $32;  // Timer Counter 0

type
  TTCCR0set = bitpacked set of (e_CS00, e_CS01, e_CS02);
  TTCCR0rec = bitpacked record
    CS00,
    CS01,
    CS02,
    ReservedBit3,
    ReservedBit4,
    ReservedBit5,
    ReservedBit6,
    ReservedBit7: TBitField;
  end;
var
  TCCR0: byte absolute $33;  // Timer/Counter0 Control Register
  TCCR0set: TTCCR0set absolute $33;
  TCCR0rec: TTCCR0rec absolute $33;
const
  CS00 = 0;  m_CS00 = 1;  // Clock Select0 bit 0
  CS01 = 1;  m_CS01 = 2;  // Clock Select0 bit 1
  CS02 = 2;  m_CS02 = 4;  // Clock Select0 bit 2

type
  TMCUSRset = bitpacked set of (e_PORF, e_EXTRF);
  TMCUSRrec = bitpacked record
    PORF,
    EXTRF,
    ReservedBit2,
    ReservedBit3,
    ReservedBit4,
    ReservedBit5,
    ReservedBit6,
    ReservedBit7: TBitField;
  end;
var
  MCUSR: byte absolute $34;  // MCU Status register
  MCUSRset: TMCUSRset absolute $34;
  MCUSRrec: TMCUSRrec absolute $34;
const
  PORF = 0;  m_PORF = 1;  // Power-On Reset Flag
  EXTRF = 1;  m_EXTRF = 2;  // External Reset Flag

type
  TMCUCRset = bitpacked set of (e_ISC00, e_ISC01, e_SM=4, e_SE);
  TMCUCRrec = bitpacked record
    ISC00,
    ISC01,
    ReservedBit2,
    ReservedBit3,
    SM,
    SE,
    ReservedBit6,
    ReservedBit7: TBitField;
  end;
var
  MCUCR: byte absolute $35;  // MCU Control Register
  MCUCRset: TMCUCRset absolute $35;
  MCUCRrec: TMCUCRrec absolute $35;
const
  ISC00 = 0;  m_ISC00 = 1;  // Interrupt Sense Control 0 bits
  ISC01 = 1;  m_ISC01 = 2;  // Interrupt Sense Control 0 bits
  SM = 4;  m_SM = 16;  // Sleep Mode
  SE = 5;  m_SE = 32;  // Sleep Enable

type
  TTIFRset = bitpacked set of (e_TOV0=1);
  TTIFRrec = bitpacked record
    ReservedBit0,
    TOV0,
    ReservedBit2,
    ReservedBit3,
    ReservedBit4,
    ReservedBit5,
    ReservedBit6,
    ReservedBit7: TBitField;
  end;
var
  TIFR: byte absolute $38;  // Timer/Counter Interrupt Flag register
  TIFRset: TTIFRset absolute $38;
  TIFRrec: TTIFRrec absolute $38;
const
  TOV0 = 1;  m_TOV0 = 2;  // Timer/Counter0 Overflow Flag

type
  TTIMSKset = bitpacked set of (e_TOIE0=1);
  TTIMSKrec = bitpacked record
    ReservedBit0,
    TOIE0,
    ReservedBit2,
    ReservedBit3,
    ReservedBit4,
    ReservedBit5,
    ReservedBit6,
    ReservedBit7: TBitField;
  end;
var
  TIMSK: byte absolute $39;  // Timer/Counter Interrupt Mask Register
  TIMSKset: TTIMSKset absolute $39;
  TIMSKrec: TTIMSKrec absolute $39;
const
  TOIE0 = 1;  m_TOIE0 = 2;  // Timer/Counter0 Overflow Interrupt Enable

type
  TGIFRset = bitpacked set of (e_PCIF=5, e_INTF0);
  TGIFRrec = bitpacked record
    ReservedBit0,
    ReservedBit1,
    ReservedBit2,
    ReservedBit3,
    ReservedBit4,
    PCIF,
    INTF0,
    ReservedBit7: TBitField;
  end;
var
  GIFR: byte absolute $3A;  // General Interrupt Flag register
  GIFRset: TGIFRset absolute $3A;
  GIFRrec: TGIFRrec absolute $3A;
const
  PCIF = 5;  m_PCIF = 32;  // Pin Change Interrupt Flag
  INTF0 = 6;  m_INTF0 = 64;  // External Interrupt Flag 0

type
  TGIMSKset = bitpacked set of (e_PCIE=5, e_INT0);
  TGIMSKrec = bitpacked record
    ReservedBit0,
    ReservedBit1,
    ReservedBit2,
    ReservedBit3,
    ReservedBit4,
    PCIE,
    INT0,
    ReservedBit7: TBitField;
  end;
var
  GIMSK: byte absolute $3B;  // General Interrupt Mask Register
  GIMSKset: TGIMSKset absolute $3B;
  GIMSKrec: TGIMSKrec absolute $3B;
const
  PCIE = 5;  m_PCIE = 32;  // Pin Change Interrupt Enable
  INT0 = 6;  m_INT0 = 64;  // External Interrupt Request 0 Enable

type
  TSREGset = bitpacked set of (e_C, e_Z, e_N, e_V, e_S, e_H, e_T, e_I);
  TSREGrec = bitpacked record
    C,
    Z,
    N,
    V,
    S,
    H,
    T,
    I: TBitField;
  end;
var
  SREG: byte absolute $3F;  // Status Register
  SREGset: TSREGset absolute $3F;
  SREGrec: TSREGrec absolute $3F;
const
  C = 0;  m_C = 1;  // Carry Flag
  Z = 1;  m_Z = 2;  // Zero Flag
  N = 2;  m_N = 4;  // Negative Flag
  V = 3;  m_V = 8;  // Two's Complement Overflow Flag
  S = 4;  m_S = 16;  // Sign Bit
  H = 5;  m_H = 32;  // Half Carry Flag
  T = 6;  m_T = 64;  // Bit Copy Storage
  I = 7;  m_I = 128;  // Global Interrupt Enable
  // typedefs = 11

implementation
{$define RELBRANCHES}
{$i avrcommon.inc}

procedure INT0_ISR; external name 'INT0_ISR'; // Interrupt 1 External Interrupt 0
procedure IO_PINS_ISR; external name 'IO_PINS_ISR'; // Interrupt 2 External Interrupt Request 0
procedure TIMER0_OVF_ISR; external name 'TIMER0_OVF_ISR'; // Interrupt 3 Timer/Counter0 Overflow
procedure ANA_COMP_ISR; external name 'ANA_COMP_ISR'; // Interrupt 4 Analog Comparator

procedure _FPC_start; assembler; nostackframe;
label
  _start;
asm
  .init
  .globl _start

  rjmp _start
  rjmp INT0_ISR
  rjmp IO_PINS_ISR
  rjmp TIMER0_OVF_ISR
  rjmp ANA_COMP_ISR

  {$i start.inc}

  .weak INT0_ISR
  .weak IO_PINS_ISR
  .weak TIMER0_OVF_ISR
  .weak ANA_COMP_ISR

  .set INT0_ISR, Default_IRQ_handler
  .set IO_PINS_ISR, Default_IRQ_handler
  .set TIMER0_OVF_ISR, Default_IRQ_handler
  .set ANA_COMP_ISR, Default_IRQ_handler
end;

end.
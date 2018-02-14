#include "msp430.h"

#define   TRIG      BIT4
#define   ECHO      BIT5

#define   TXD       BIT2
#define   RXD       BIT1

#define   SOUND     34029         // speed of sound in cm/s
#define   US        1000000       // microseconds in a second

unsigned int TXByte;

void main(void) {
  WDTCTL = WDTPW + WDTHOLD;       // Stop WDT

  BCSCTL1  = CALBC1_1MHZ;         // Set range
  DCOCTL   = CALDCO_1MHZ;
  BCSCTL2 &= ~(DIVS_3);           // SMCLK = DCO = 1 MHz

  P1SEL     = BIT1 + BIT2 ;       // P1.1 = RXD, P1.2=TXD
  P1SEL2    = BIT1 + BIT2 ;       // P1.1 = RXD, P1.2=TXD
  UCA0CTL1 |= UCSSEL_2;           // Use SMCLK
  UCA0BR0   = 104;                // Set baud rate to 9600 with 1MHz clock (Data Sheet 15.3.13)
  UCA0BR1   = 0;                  // Set baud rate to 9600 with 1MHz clock
  UCA0MCTL  = UCBRS0;             // Modulation UCBRSx = 1
  UCA0CTL1 &= ~UCSWRST;           // Initialize USCI state machine

  P1DIR |= TXD;
  P1OUT |= TXD;

  P1DIR |=  TRIG;
  P1DIR &= ~ECHO;
  P1IE  |=  ECHO;

  TACTL = TASSEL_2 | ID_0 | MC_2; // set timer to count up
  __enable_interrupt();

  while (1) {
    P1OUT |=  TRIG;               // start trigger signal
    __delay_cycles(15);           // we need a >10 us pulse but one clock cycle is 1 us
    P1OUT &= ~TRIG;               // end trigger signal

    P1IES &= ~ECHO;
    __bis_SR_register(LPM0_bits + GIE);
    TAR = 0;
    P1IES |=  ECHO;
    __bis_SR_register(LPM0_bits + GIE);
    
    TXByte = TAR;                 // time elapsed in us (approx)
    while (!(IFG2 & UCA0TXIFG));  // wait for TX buffer to be ready for new data
    UCA0TXBUF = TXByte * SOUND / US / 2;    // curiously, this is a factor of 2 off

    __delay_cycles(100000);       // wait 100 ms before measuring again
  }
}

#if defined(__TI_COMPILER_VERSION__)
#pragma vector=PORT1_VECTOR
__interrupt void port1_isr(void)
#else
  void __attribute__ ((interrupt(PORT1_VECTOR))) port1_isr (void)
#endif
{
  P1IFG = 0;
  __bic_SR_register_on_exit(LPM0_bits); // take us out of low power mode
}
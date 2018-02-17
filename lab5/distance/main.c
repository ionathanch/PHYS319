#include "msp430.h"

#define   TXD       BIT2
#define   RXD       BIT1

#define   TRIG      BIT4
#define   ECHO      BIT6

#define   SOUND     34029       // speed of sound in cm/s
#define   US        1000000     // microseconds in a second

unsigned int TXByte;

void main(void) {
  WDTCTL    = WDTPW + WDTHOLD;  // Stop WDT

  BCSCTL1   = CALBC1_1MHZ;      // Set range
  DCOCTL    = CALDCO_1MHZ;
  BCSCTL2  &= ~(DIVS_3);        // SMCLK = DCO = 1 MHz

  P1SEL     = BIT1 + BIT2;      // P1.1 = RXD, P1.2=TXD
  P1SEL2    = BIT1 + BIT2;      // P1.1 = RXD, P1.2=TXD
  UCA0CTL1 |= UCSSEL_2;         // Use SMCLK
  UCA0BR0   = 104;              // Set baud rate to 9600 with 1MHz clock (Data Sheet 15.3.13)
  UCA0BR1   = 0;                // Set baud rate to 9600 with 1MHz clock
  UCA0MCTL  = UCBRS0;           // Modulation UCBRSx = 1
  UCA0CTL1 &= ~UCSWRST;         // Initialize USCI state machine

  P1DIR    |= TXD;
  P1OUT    |= TXD;

  P1DIR    |=  TRIG;            // set trigger output
  P1DIR    &= ~ECHO;            // set echo input
  P1IE     |=  ECHO;            // use echo input as interrupt

  TACTL     = TACLR;                    // reset clock
  TACTL     = TASSEL_2 | ID_1 | MC_2;   // set SMCLK timer to count up at 1 MHz
  __enable_interrupt();

  while (1) {
    P1OUT |=  TRIG;                     // start trigger signal
    __delay_cycles(10);                 // we need a >10 us pulse and one clock cycle is 1 us
    P1OUT &= ~TRIG;                     // end trigger signal

    P1IES &= ~ECHO;                     // interrupt on low to high
    __bis_SR_register(LPM0_bits + GIE);
    TAR = 0;
    P1IES |=  ECHO;                     // interrupt on high to low
    __bis_SR_register(LPM0_bits + GIE);
    
    TXByte = TAR * SOUND / US;          // distance in cm
    TXByte = (TXByte <= 0xFF) * TXByte; // set to 0 if beyond range
    while (!(IFG2 & UCA0TXIFG));        // wait for TX buffer to be ready for new data
    UCA0TXBUF = TXByte;           

    __delay_cycles(100000);             // wait >10 ms before measuring again
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
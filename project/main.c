#include "msp430.h"

#define   TXD       BIT2
#define   RXD       BIT1
#define   LED       BIT0

#define   US        1000000

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

  P1DIR    |= TXD | LED;
  P1OUT    |= TXD;

  TACTL     = TACLR;            // reset clock
  TACTL     = TASSEL_2 | MC_2;  // set SMCLK timer to count up at 1 MHz
  TACCTL0   = CM1 | SCS | CAP | CCIE;   // set capture mode to rising edge and enable interrupts
  
  while (1) {
    TAR = 0;
    P1OUT ^= LED;
    __enable_interrupt();
    __bis_SR_register(LPM0_bits + GIE);
    TXByte = US/TACCR0;                 // frequency in Hertz
    while (!(IFG2 & UCA0TXIFG));        // wait for TX buffer to be ready for new data
    UCA0TXBUF = (TXByte - 110)/2;       // send range of 110 Hz (A below low C) to 621 Hz (D above high C)
    __delay_cycles(100000);             // wait >10 ms before measuring again
  }
}

#if defined(__TI_COMPILER_VERSION__)
#pragma vector=TIMER0_A0_VECTOR
__interrupt void timer0_a0_isr(void)
#else
  void __attribute__ ((interrupt(TIMER0_A0_VECTOR))) timer0_a0_isr (void)
#endif
{
  TACCTL0 &= ~CCIFG;                    // set interrupt flag to 0
  __disable_interrupt();                // disable interrupts
  __bic_SR_register_on_exit(LPM0_bits); // take us out of low power mode
} 
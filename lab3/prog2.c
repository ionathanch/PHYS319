/*
 * PHYS319 Lab 3 Interrupt Example in C
 *
 * Written by Ryan Wicks
 * 16 Jan 2012
 *
 * This program is a C version of the assembly program that formed part of 
 * lab 2.
 *
 *
 */
#include <msp430.h>

void main(void) {
    WDTCTL = WDTPW + WDTHOLD;   // Stop watchdog timer
    P1DIR  = 0xF7;              // C does not have a convenient way of
                                // representing numbers in binary; use hex instead
    P1OUT  = 0x49;
    P1REN  = 0x08;              // enable resistor
    P1IE   = 0x08;              // Enable input at P1.3 as an interrupt

    _BIS_SR (LPM4_bits + GIE);  // Turn on interrupts and go into the lowest
                                // power mode (the program stops here)
                                // Notice the strange format of the function, it is an "intrinsic"
                                // ie. not part of C; it is specific to this chipset
}

// Port 1 interrupt service routine
void __attribute__ ((interrupt(PORT1_VECTOR))) PORT1_ISR(void) {
    P1OUT ^= 0x41;              // toggle the LEDS
    P1IFG &= ~0x08;             // Clear P1.3 IFG. If you don't, it just happens again.
}

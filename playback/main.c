#include "msp430.h"
#include <stdlib.h>
#include <stdbool.h>

#define MIDC   3822
#define DFLAT  3608
#define D      3405
#define EFLAT  3214
#define E      3034
#define F      2863
#define GFLAT  2703
#define G      2551
#define AFLAT  2408
#define A      2273
#define BFLAT  2145
#define B      2025
#define TENC   1911
#define NONE   0

#define LED1   BIT0
#define BUTTON BIT3
#define OUTPUT BIT6

// constants used for unit conversions in timer interrupt
// CSINT should be 256^2 / 10 000 = 65 536 / 10 000 = 6
// USINT should be 60 000
#define CSUS   10000    // microseconds (us) in a centisecond (cs)
#define CSINT  6        // centiseconds storable in int of microseconds
#define USINT  60000    // CSINT in microseconds

#define MAXNOTES 0xA2   // 162 (not enough RAM to allocate any more to rec)

// pitch  is index of scale array
// length is in centiseconds
// max length of note is 0xFFF = approx. 41 seconds
typedef struct {
    unsigned int pitch  : 4;
    unsigned int length : 12;
} Note;

unsigned int scale[16] = {
    NONE,  MIDC, DFLAT, D, EFLAT, E, F, 
    GFLAT, G,    AFLAT, A, BFLAT, B, TENC,
    NONE,  NONE  // should not be used
};

Note rec[MAXNOTES];
volatile bool recording = true;
volatile unsigned int notes = 1;
volatile unsigned int us    = 0;
volatile unsigned int cs    = 0;

void play(unsigned int pitch) {
    if (pitch != 0) {
        CCR0 = scale[pitch];
        CCR1 = scale[pitch] / 2;  // max volume
    } else {
        CCR0 = 0xFFFF;  // cannot count to 0; set to max
        CCR1 = 0;
    }
}

void playback() {
    for (unsigned int i = 0; i < notes; i++) {
        play(rec[i].pitch);
        for (unsigned int j = 0; j < rec[i].length; j++) {
            __delay_cycles(CSUS);
        }
    }
}

void save_length(unsigned int position) {
    rec[position].length = cs + (us + TAR)/CSUS;
    cs = us = TAR = 0;  // reset all counts
}

void end_record() {
    recording = false;
    P1OUT    &= ~LED1;
    TACCTL0  &= ~CCIE;
    play(0);
}

void record() {
    TAR = 0;
    P1OUT |= LED1;
    while (recording && notes < MAXNOTES) {
        unsigned int pitch = P2IN & 0xF;
        if (pitch != rec[notes - 1].pitch) {
            save_length(notes - 1);
            rec[notes].pitch = pitch;
            play(pitch);
            notes++;
        }
        __delay_cycles(1000);
    }
    end_record();
}

void main(void) {
    WDTCTL  = WDTPW + WDTHOLD;      // Stop WDT

    P2DIR   = 0;                    // P2 all input
    P2REN   = 0xF;                  // P2 inputs resistor enable
    P2OUT   = 0;                    // P2 resistor pulldown
    P1DIR   = OUTPUT | LED1;        // P1.6, P1.0 output (P1.3 input)
    P1SEL  |= OUTPUT;               // P1.6 to TA0.1
    P1REN   = BUTTON;               // button resistor enable
    P1IE    = BUTTON;               // enable button interrupt

    CCTL1   = OUTMOD_7;             // CCR1 reset/set
    TACTL   = TASSEL_2 | MC_1;      // SMCLK (1 MHz) count up to CCRO
    TACCTL0 = CCIE;                 // enable clock  interrupt

    __enable_interrupt();
    record();
    __bis_SR_register(LPM0_bits);
}

#if defined(__TI_COMPILER_VERSION__)
#pragma vector=TIMER0_A0_VECTOR
__interrupt void timer0_a0_isr(void)
#else
    void __attribute__ ((interrupt(TIMER0_A0_VECTOR))) timer0_a0_isr (void)
#endif
{
    unsigned int us_left = USINT - us;  // count up to USINT microseconds in us
    if (us_left < TACCR0) {
        cs += CSINT;            // add centiseconds to cs count
        us = TACCR0 - us_left;  // save overflow
    } else {
        us += TACCR0;           // add microseconds to us count
    }
    TACCTL0 &= ~CCIFG;          // set interrupt flag to 0
}

#if defined(__TI_COMPILER_VERSION__)
#pragma vector=PORT1_VECTOR
__interrupt void port1_isr(void)
#else
  void __attribute__ ((interrupt(PORT1_VECTOR))) port1_isr (void)
#endif
{    
    if (recording) {
        save_length(notes);
        end_record();
    }
    playback();
    P1IFG &= ~BUTTON;           // set interrupt flag to 0
}

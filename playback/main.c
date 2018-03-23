#include "msp430.h"
#include <stdlib.h>
#include <stdbool.h>

#define c     3822
#define dflat 3608
#define d     3405
#define eflat 3214
#define e     3034
#define f     2863
#define gflat 2703
#define g     2551
#define aflat 2408
#define a     2273
#define bflat 2145
#define b     2025
#define cc    1911
#define n     0

#define LED1   BIT0
#define BUTTON BIT3
#define OUTPUT BIT6

// CSINT should be 256^2 / 10 000 = 65 536 / 10 000 = 6
// USINT should be 60 000
#define CSUS  10000     // microseconds (us) in a centisecond (cs)
#define CSINT 6         // centiseconds storable in int of microseconds
#define USINT 60000     // CSINT in microseconds

#define MAXNOTES 0x4D   // not enough RAM to allocate any more to rec, len :(

// max length of note is 0xFFFF centiseconds = approx. 10 minutes
unsigned int rec[MAXNOTES]; // notes recorded
unsigned int len[MAXNOTES]; // length of each note in centiseconds

volatile bool recording = true;
volatile unsigned int notes = 1;
volatile unsigned int us    = 0;
volatile unsigned int cs    = 0;

unsigned int scale[16] = {
    n, c, dflat, d, eflat, e, f, gflat, g, aflat, a, bflat, b, cc, n, n
};

unsigned int whole[8] = {
    c, d, e, f, g, a, b, cc
};

void play(unsigned int note) {
    if (note != n) {
        CCR0 = note;
        CCR1 = 250;
    } else {
        CCR0 = 0xFFFF;  // cannot count to 0; set to max
        CCR1 = 0;
    }
}

void playback() {
    for (unsigned int i = 0; i < notes; i++) {
        play(rec[i]);
        for (unsigned int j = 0; j < len[i]; j++) {
            __delay_cycles(CSUS);
        }
    }
}

void save_length(unsigned int position) {
    len[position] = cs + (us + TAR)/CSUS;
    cs = us = TAR = 0;  // reset all counts
}

void end_record() {
    P1OUT   &= ~LED1;
    TACCTL0 &= ~CCIE;
    play(n);
}

void record() {
    unsigned int note;
    TAR = 0;
    P1OUT |= LED1;
    while (recording && notes < MAXNOTES) {
        note = scale[P2IN & 0xF];
        if (note != rec[notes - 1]) {
            save_length(notes - 1);
            rec[notes] = note;
            play(note);
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
        recording = false;
        end_record();
    }
    playback();
    P1IFG &= ~BUTTON;          // set interrupt flag to 0
}

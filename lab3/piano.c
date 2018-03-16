#include "msp430.h"
#include <stdlib.h>

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

unsigned int hbd[30] = {
    c,  n, c, 
    d,  c, f,
    e,  c, n, c,
    d,  c, g,
    f,  c, n, c,
    cc, a, f,
    e,  d, bflat, n, bflat,
    a,  f, g,
    f,  n
};
unsigned int hbd_lengths[30] = {
    1, 1, 1, 
    3, 3, 3, 
    6, 1, 1, 1,
    3, 3, 3, 
    6, 1, 1, 1, 
    3, 3, 3, 
    3, 6, 1, 1, 1, 
    3, 3, 3, 
    6, 3
};

unsigned int scale[13] = {
    c, dflat, d, eflat, e, f, gflat, g, aflat, a, bflat, b, cc
};
unsigned int scale_lengths[13] = {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
};

unsigned int whole[8] = {
    c, d, e, f, g, a, b, cc
};

void play(unsigned int note) {
    if (note != 0) {
        CCR0 = note;
        CCR1 = 100;
    } else {
        CCR1 = 0;
    }
}

void sing(unsigned int* song, unsigned int* song_lengths, unsigned int length) {
    for (int i = 0; i < length; i++) {
        play(song[i]);
        for (int j = 0; j < song_lengths[i]; j++) {
            __delay_cycles(0x200);
        }
    }
}

unsigned int us = 0;
unsigned int cs = 0;

void main(void) {
    WDTCTL  = WDTPW + WDTHOLD;      // Stop WDT
  
    P1DIR   = BIT6;                 // set P1.6 to output
    P1SEL  |= BIT6;                 // P1.6 to TA0.1
  
    CCTL1   = OUTMOD_7;             // CCR1 reset/set
    TACTL   = TASSEL_2 | MC_1;      // SMCLK, up to CCR0
    TACCTL0 = CCIE;                 // enable interrupt
    __enable_interrupt();
    
    unsigned int rec[10] = {n, b, b, b, b, b, b, b, b, b};
    unsigned int rec_len[10] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
    unsigned int position = 1;
    TAR = 0;
    while (position < 10) {
        if (whole[P1IN & 0xF] != rec[position - 1]) {
            rec_len[position - 1] = cs + (us + TAR)/10000;
            rec[position] = whole[P1IN & 0xF];
            play(rec[position]);
            cs = us = TAR = 0;
            position++;
        }
        __delay_cycles(0x200);
    }

    sing(rec, rec_len, 10);
    //clear();
    //sing(hbd, hbd_lengths, 30);
    //sing(scale, scale_lengths, 13);
}

#if defined(__TI_COMPILER_VERSION__)
#pragma vector=TIMER0_A0_VECTOR
__interrupt void timer0_a0_isr(void)
#else
    void __attribute__ ((interrupt(TIMER0_A0_VECTOR))) timer0_a0_isr (void)
#endif
{
    unsigned int us_left = 60000 - us;  // count up to 60 000 microseconds in us
    if (us_left > TACCR0) {
        cs += 6;                        // add six centiseconds to count
        us = TACCR0 - us_left;          // save overflow
    } else {
        us += TACCR0;
    }
    TACCTL0 &= ~CCIFG;                  // set interrupt flag to 0
} 

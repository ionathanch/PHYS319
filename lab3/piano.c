#include "msp430.h"
#include <stdlib.h>

#define c     1000
#define dflat 950
#define d     900
#define eflat 850
#define e     800
#define f     750
#define gflat 720
#define g     670
#define aflat 625
#define a     600
#define bflat 570
#define b     535
#define cc    500
#define n     0

int hbd[30] = {
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
int hbd_lengths[30] = {
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

int scale[13] = {
    c, dflat, d, eflat, e, f, gflat, g, aflat, a, bflat, b, cc
};
int scale_lengths[13] = {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
};

int whole[8] = {
    c, d, e, f, g, a, b, cc
};

void play(int note) {
    if (note != 0) {
        CCR0 = note;
        CCR1 = 100;
    } else {
        CCR1 = 0;
    }
}

void sing(int* song, int* song_lengths, int length) {
    for (int i = 0; i < length; i++) {
        int note = song[i];
        play(note);
        for (int j = 0; j < song_lengths[i]; j++) {
            __delay_cycles(0x3000);
        }
    }
}

void main(void) {
    WDTCTL = WDTPW + WDTHOLD;    // Stop WDT
  
    P1DIR  = BIT6;               // set P1.6 to output
    P1SEL |= BIT6;               // P1.6 to TA0.1
  
    CCTL1 = OUTMOD_7;            // CCR1 reset/set
    TACTL = TASSEL_2 + MC_1;     // SMCLK, up mode
    
    int recording[10] = {n};
    int recording_lengths[10] = {0};
    int position = 1;
    while(position < 10) {
        if (whole[P1IN] != recording[position - 1]) {
            recording[position] = whole[P1IN];
            recording_lengths[position] = 1;
            play(recording[position]);
            position++;
        }
    }

    sing(recording, recording_lengths, 10);
    //clear();
    //sing(hbd, hbd_lengths, 30);
    //sing(scale, scale_lengths, 13);
}

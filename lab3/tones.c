#include "msp430.h"

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

// 7 6 4 5   3   2   1  0
// ..note.. str out A1 A0
unsigned char show(int note) {
    switch (note) {
        case c:
        case cc:
            return 0xc0;
        case d:
        case dflat:
            return 0xd0;
        case e:
        case eflat:
            return 0xe0;
        case f:
            return 0xf0;
        case g:
        case gflat:
            return 0x60;
        case a:
        case aflat:
            return 0xa0;
        case bflat:
        case b:
            return 0xb0;
        default:
            return 0x00;
    }
}

unsigned char acc(int note) {
    switch (note) {
        case bflat:
        case dflat:
        case eflat:
        case gflat:
        case aflat:
            return 0xf1;
        case cc:
            return 0xc1;
        default:
            return 0x01;
    }
}

void play(int note) {
    if (note != 0) {
        CCR0 = note;
        CCR1 = 100;
    } else {
        CCR1 = 0;
    }
}

void display(unsigned char out) {
    P1OUT  = out;
    P1OUT |= 0x08;
}

void sing(int* song, int* song_lengths, int length) {
    while (1) {
        for (int i = 0; i < length; i++) {
            int note = song[i];
            play(note);
            display(show(note));
            display(acc(note));
            for (volatile unsigned int length = song_lengths[i]; length > 0; length--) {
                for (volatile unsigned int i = 0x3000; i > 0; i--);
            }
        }
    }
}

void clear() {
    for (unsigned char i = 0; i < 4; i++) {
        P1OUT = i;
        P1OUT = i | 0x08;
    }
}

void main(void) {
    WDTCTL = WDTPW + WDTHOLD;    // Stop WDT
  
    P1DIR  = 0xFF;               // all set to output
    P1SEL |= BIT2;               // P1.2 to TA0.1
  
    CCTL1 = OUTMOD_7;            // CCR1 reset/set
    TACTL = TASSEL_2 + MC_1;     // SMCLK, up mode
    
    clear();
    sing(hbd, hbd_lengths, 30);
    //sing(scale, scale_lengths, 13);
}

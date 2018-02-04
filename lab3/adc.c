//******************************************************************************
//  MSP430G2x31 Demo - ADC10, Sample A1, AVcc Ref, Set P1.0 if > 0.75*AVcc
//
//  Description: A single sample is made on A1 with reference to AVcc.
//  Software sets ADC10SC to start sample and conversion - ADC10SC
//  automatically cleared at EOC. ADC10 internal oscillator times sample (16x)
//  and conversion. 
//
//                MSP430G2x31
//             -----------------
//         /|\|              XIN|-
//          | |                 |
//          --|RST          XOUT|
//            |                 |           
//            |                 |
//            |                 |
//            |                 |
//            |                 |
// input  >---|P1.1/A1      P1.0|--> red Led onboard BIT0
//            |                 |
//            |             P1.2|--> yellow Led 
//            |             P1.6|--> green Led onboard BIT6
//
//
//  D. Dang
//  Texas Instruments Inc.
//******************************************************************************
#include "msp430.h"

void main(void) {
    WDTCTL    = WDTPW + WDTHOLD;        // Stop WDT
    ADC10CTL0 = ADC10SHT_2 + ADC10ON;   // ADC10ON
    ADC10CTL1 = INCH_1;                 // input A1
    ADC10AE0 |= 0x02;                   // PA.1 ADC option select
    P1DIR    |= 0x45;                   // Set P1.0 to output direction

    while (1) {
        ADC10CTL0 |= ENC + ADC10SC;     // Sampling and conversion start
        while (ADC10CTL1 & ADC10BUSY);  // ADC10BUSY?
        P1OUT &= ~0x45;
        if (ADC10MEM > 0x2FF) {
            P1OUT |= 0x01;
        } else if (ADC10MEM < 0x133) {
            P1OUT |= 0x40;
        } else {
            P1OUT |= 0x04;
        }
        unsigned i;
        for (i = 0xFFFF; i > 0; i--);   // Delay
    }
}
//******************************************************************************

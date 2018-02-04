#include "msp430.h"

void main(void) {
    WDTCTL    = WDTPW + WDTHOLD;
    
    ADC10CTL0 = ADC10SHT_2 + ADC10ON;
    ADC10CTL1 = INCH_1;
    ADC10AE0 |= 0x02;

    P1DIR |= BIT2;
    P1SEL |= BIT2;
  
    CCR0  = 1000-1;
    CCTL1 = OUTMOD_7;
    TACTL = TASSEL_2 + MC_1;

    while (1) {
        ADC10CTL0 |= ENC + ADC10SC;
        while (ADC10CTL1 & ADC10BUSY);
        CCR1 = (1000 * ADC10MEM) / 0x3FF;
        for (volatile unsigned int i = 0xFFFF; i > 0; i--);
    }
}
/*
 * main.c
 *
 * MSP-EXP430G2-LaunchPad User Experience Application
 *
 * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/ 
 * 
 * 
 *  Redistribution and use in source and binary forms, with or without 
 *  modification, are permitted provided that the following conditions 
 *  are met:
 *
 *    Redistributions of source code must retain the above copyright 
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the 
 *    documentation and/or other materials provided with the   
 *    distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *

 * Heavily modified: Nov, 2013 Carl Michal
 * Even more so, February, 2014

 * This version modified to use the Hardware UART on MSP430G2553
 * see code at https://bennthomsen.wordpress.com/engineering-toolbox/ti-msp430-launchpad/msp430g2553-hardware-uart/
 * jumpers for TX/RX on Launchpad board must be rotated 90 degrees
 * for hardware UART used here!!
 * This may not work on all revisions of the board?


*/


/******************************************************************************
 *                  MSP-EXP430G2-LaunchPad User Experience Application
 *
 * 1. Device starts up in LPM3 + blinking LED to indicate device is alive    
 *    + Upon first button press, device transitions to application mode
 * 2. Application Mode
 *    + Continuously sample ADC Temp Sensor channel
 *       
 *    + Transmit temperature value via TimerA UART to PC  
 * 
 *
 * Texas Instruments, Inc.
 ******************************************************************************/
  
#include  "msp430.h"

#define     LED1                  BIT0
#define     LED2                  BIT6

#define     BUTTON                BIT3

#define     TXD                   BIT2                      // TXD on P1.2
#define     RXD                   BIT1                      // RXD on P1.1

#define     PreAppMode            0
#define     RunningMode           1

unsigned int TXByte;
volatile unsigned int Mode;   
  
void InitializeButton(void);
void PreApplicationMode(void); 

void main(void)
{
  long tempMeasured;

  WDTCTL = WDTPW + WDTHOLD;                 // Stop WDT

  /* next three lines to use internal calibrated 1MHz clock: */
  BCSCTL1 = CALBC1_1MHZ;                    // Set range
  DCOCTL = CALDCO_1MHZ;
  BCSCTL2 &= ~(DIVS_3);                     // SMCLK = DCO = 1MHz  

  InitializeButton();

  // setup port for leds:
  P1DIR |= LED1 + LED2;                          
  P1OUT &= ~(LED1 + LED2);  

  P1DIR |= TXD;
  P1OUT |= TXD;
  
  Mode = PreAppMode;
  PreApplicationMode();          // Blinks LEDs, waits for button press
  
  /* Configure ADC Temp Sensor Channel */
  ADC10CTL1 = INCH_10 + ADC10DIV_3;         // Temp Sensor ADC10CLK/4
  ADC10CTL0 = SREF_1 + ADC10SHT_3 + REFON + ADC10ON + ADC10IE;

  __delay_cycles(1000);                     // Wait for ADC Ref to settle  
   
  __enable_interrupt();                     // Enable interrupts.

  /* Configure hardware UART */
  P1SEL = BIT1 + BIT2 ; // P1.1 = RXD, P1.2=TXD
  P1SEL2 = BIT1 + BIT2 ; // P1.1 = RXD, P1.2=TXD
  UCA0CTL1 |= UCSSEL_2; // Use SMCLK
  UCA0BR0 = 104; // Set baud rate to 9600 with 1MHz clock (Data Sheet 15.3.13)
  UCA0BR1 = 0; // Set baud rate to 9600 with 1MHz clock
  UCA0MCTL = UCBRS0; // Modulation UCBRSx = 1
  UCA0CTL1 &= ~UCSWRST; // Initialize USCI state machine
  /* if we were going to receive, we would also:
     IE2 |= UCA0RXIE; // Enable USCI_A0 RX interrupt
  */
  
  /* Main Application Loop */
  while(1)
  {    
    ADC10CTL0 |= ENC + ADC10SC;        // Sampling and conversion start
    __bis_SR_register(CPUOFF + GIE);   // LPM0 with interrupts enabled  turns cpu off.
    // an interrupt is triggered when the ADC result is ready. 
    // The interrupt handler restarts the cpu.
    
    // store result 
    tempMeasured = ADC10MEM;   


    // convert to farenheit and send to host computer
    TXByte = (unsigned char)( ((tempMeasured - 630) * 761) / 1024 );
    while (! (IFG2 & UCA0TXIFG)); // wait for TX buffer to be ready for new data
    UCA0TXBUF = TXByte;

    P1OUT ^= LED1;  // toggle the light every time we make a measurement.
        
    // set up timer to wake us in a while:
    TACCR0 = 2400;                             //  period
    TACTL = TASSEL_1 | MC_1;                  // TACLK = ACLK, Up mode.  
    TACCR1 = 2400; // interrupt at end
    TACCTL1 = CCIE;                // TACCTL0 

    // go to sleep, wait till timer expires to do another measurement.
    __bis_SR_register(LPM3_bits + GIE);  // LPM0 with interrupts enabled  turns cpu off.

    // could have just done this - but low power mode is nicer.
    //  __delay_cycles(500000);  

  }  
}

void PreApplicationMode(void)
{    
  P1DIR |= LED1 + LED2;
  P1OUT |= LED1;                 // To enable the LED toggling effect
  P1OUT &= ~LED2;
    
  /* these next two lines configure the ACLK signal to come from 
     a secondary oscillator source, called VLO */

  BCSCTL1 |= DIVA_1;             // ACLK is half the speed of the source (VLO)
  BCSCTL3 |= LFXT1S_2;           // ACLK = VLO
  
  /* here we're setting up a timer to fire an interrupt periodically. 
     When the timer 1 hits its limit, the interrupt will toggle the lights 

     We're using ACLK as the timer source, since it lets us go into LPM3
     (where SMCLK and MCLK are turned off). */

  TACCR0 = 1200;                 //  period
  TACTL = TASSEL_1 | MC_1;       // TACLK = ACLK, Up mode.  
  TACCTL1 = CCIE + OUTMOD_3;     // TACCTL1 Capture Compare
  TACCR1 = 600;                  // duty cycle
  __bis_SR_register(LPM3_bits + GIE);   // LPM3 with interrupts enabled
  // in LPM3, MCLCK and SMCLK are off, but ACLK is on.
}

// this gets used in pre-application mode only to toggle the lights:
#if defined(__TI_COMPILER_VERSION__)
#pragma vector=TIMER0_A1_VECTOR
__interrupt void ta1_isr (void)
#else
  void __attribute__ ((interrupt(TIMER0_A1_VECTOR))) ta1_isr (void)
#endif
{
  TACCTL1 &= ~CCIFG; // reset the interrupt flag
  if (Mode == PreAppMode){
    P1OUT ^= (LED1 + LED2); // toggle the two lights.
  }
  else{
    TACCTL1 = 0;                // no more interrupts.
    __bic_SR_register_on_exit(LPM3_bits);        // Restart the cpu
  }
    
}

void InitializeButton(void)                 // Configure Push Button 
{
  P1DIR &= ~BUTTON;
  P1OUT |= BUTTON;
  P1REN |= BUTTON;
  P1IES |= BUTTON;
  P1IFG &= ~BUTTON;
  P1IE |= BUTTON;
}

/* *************************************************************
 * Port Interrupt for Button Press 
 * 1. During standby mode: to enter application mode
 *
 * *********************************************************** */

#if defined(__TI_COMPILER_VERSION__)
#pragma vector=PORT1_VECTOR
__interrupt void port1_isr(void)
#else
  void __attribute__ ((interrupt(PORT1_VECTOR))) port1_isr (void)
#endif
{   
  
  /* this disables port1 interrupts for a little while so that
  we don't try to respond to two consecutive button pushes right together.
  The watchdog timer interrupt will re-enable port1 interrupts 

  This whole watchdog thing is completely unnecessary here, but its useful 
  to see how it is done.
*/
  P1IFG = 0;  // clear out interrupt flag
  P1IE &= ~BUTTON;         // Disable port 1 interrupts 
  WDTCTL = WDT_ADLY_250;   // set up watchdog timer duration 
  IFG1 &= ~WDTIFG;         // clear interrupt flag 
  IE1 |= WDTIE;            // enable watchdog interrupts
    
  TACCTL1 = 0;             // turn off timer 1 interrupts
  P1OUT &= ~(LED1+LED2);   // turn off the leds
  Mode = RunningMode;
  __bic_SR_register_on_exit(LPM3_bits); // take us out of low power mode
  
}

// WDT Interrupt Service Routine used to de-bounce button press
#if defined(__TI_COMPILER_VERSION__)
#pragma vector=WDT_VECTOR
__interrupt void wdt_isr(void)
#else
  void __attribute__ ((interrupt(WDT_VECTOR))) wdt_isr (void)
#endif
{
    IE1 &= ~WDTIE;                   /* disable watchdog interrupt */
    IFG1 &= ~WDTIFG;                 /* clear interrupt flag */
    WDTCTL = WDTPW + WDTHOLD;        /* put WDT back in hold state */
    P1IE |= BUTTON;             /* Debouncing complete - reenable port 1 interrupts*/
}

// ADC10 interrupt service routine
#if defined(__TI_COMPILER_VERSION__)
#pragma vector=ADC10_VECTOR
__interrupt void adc10_isr(void)
#else
  void __attribute__ ((interrupt(ADC10_VECTOR))) adc10_isr (void)
#endif
{
  __bic_SR_register_on_exit(CPUOFF);        // Restart the cpu
}


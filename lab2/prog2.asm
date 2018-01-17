#include "msp430g2553.inc"

    org 0x0C000
RESET:
    mov.w   #0x400,         SP
    mov.w   #WDTPW|WDTHOLD, &WDTCTL
    mov.b   #11110111b,     &P1DIR      ; all pins outputs except P1.3
    mov.b   #00001000b,     &P1REN      ; enable resistor for P1.3
    mov.b   #00001000b,     &P1IE       ; P1.3 set as an interrupt
    mov.w   #0x0049,        R7          ; R7 = 0000 0000 0100 1001
    mov.b   R7,             &P1OUT      ; LED1, LED2 on
    mov.b    #0x0041,       R8          ; value to xor with R7
    EINT                                ; enable interrupts
    bis.w   #CPUOFF,        SR
PUSH:
    xor.w   R8,             R7          ; next LED state
    xor.w   #0x0040,        R8          ; 0x0041 -> 0x0001 -> 0x0041
    mov.b   R7,             &P1OUT      ; set LEDs to new state
    bic.b   #00001000b,     &P1IFG      ; interrupt flag P1.3 set to 0
    reti                                ; return from interrupt

    org 0xffe4
    dw PUSH                             ; interrupt from button goes here

    org 0xfffe
    dw RESET                            ; interrupt from reset button goes here

.include "msp430g2553.inc"

    org 0x0C000
RESET:
    mov.w   #0x400,         SP
    mov.w   #WDTPW|WDTHOLD, &WDTCTL
    mov.b   #11110111b,     &P1DIR      ; all pins outputs except P1.3
    mov.b   #00001000b,     &P1REN      ; enable resistor pull for P1.3
    mov.b   #00001000b,     &P1IE       ; P1.3 set as an interrupt
    mov.b   #00001000b,     R7          ; set LEDs off and P1.3 pullup
    mov.b   R7,             &P1OUT      ; LED1, LED2 on
    mov.b   #00000001b,     R8          ; initial value to xor with R7
    EINT                                ; enable interrupts
    bis.w   #CPUOFF,        SR
PUSH:
    xor.b   R8,             R7          ; next LED state
    xor.b   #01000000b,     R8          ; 0x0041 -> 0x0001 -> 0x0041
    mov.b   R7,             &P1OUT      ; set LEDs to new state
    mov.w   #0xFFFF,        R9          ; decrementing delay in R9
LOOP:
    dec     R9
    nop                                 ; the more nops, the longer the delay
    nop
    nop
    nop
    jnz     LOOP
    jmp     PUSH

    org 0xffe4
    dw PUSH                             ; interrupt from button goes here

    org 0xfffe
    dw RESET                            ; interrupt from reset button goes here
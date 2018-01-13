.include "msp430g2553.inc"

org 0xc000
start:
    mov.w   #WDTPW|WDTHOLD, &WDTCTL
    mov.b   #0x41,          &P1DIR  ; 01000001b
    mov.w   #0x01,          r8
repeat:
    mov.b   r8,             &P1OUT
    xor.b   #0x41,          r8
    mov.w   #60000,         r9
waiter:
    dec     r9
    jnz     waiter
    jmp     repeat

org 0xfffe
    dw      start
.include "msp430g2553.inc"

org 0xc000
START:
    mov.b   #11111111b, &P1DIR
    mov.b   &P1IN,      R7      ;R7 = 0x01
    bis.w   #CPUOFF,    SR

org 0xfffe
    dw      START
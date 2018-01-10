.include "msp430g2553.inc"

org 0xc000
START:
    ; setup
    mov     #0x0400,        SP
    mov.w   #WDTPW|WDTHOLD, &WDTCTL
    mov.b   #11110111b,     &P1DIR

    ; set digits
    mov.b   #01100001b,     &P1OUT  ; xxx6
    mov.b   #01100000b,     &P1OUT

    mov.b   #01000011b,     &P1OUT  ; xx46
    mov.b   #01000010b,     &P1OUT

    mov.b   #00010101b,     &P1OUT  ; x146
    mov.b   #00010100b,     &P1OUT

    mov.b   #01000111b,     &P1OUT  ; 4146
    mov.b   #01000110b,     &P1OUT

    ; disable
    bis.w   #CPUOFF,        SR

org 0xfffe
    dw      START

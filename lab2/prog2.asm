#include "msp430g2553.inc"

	org 0x0C000
RESET:
	mov.w   #0x400,         SP
	mov.w   #WDTPW|WDTHOLD, &WDTCTL
	mov.b   #11110111b,     &P1DIR
	mov.b   #01001001b,     &P1OUT
	mov.b   #00001000b,     &P1REN
	mov.b   #00001000b,     &P1IE
	mov.w   #0x0049,        R7
	mov.b   R7,             &P1OUT
	EINT
	bis.w   #CPUOFF,        SR
PUSH:
	xor.w #0000000001000001b, R7
	mov.b R7,               &P1OUT
	bic.b #00001000b,       &P1IFG
	reti

	org 0xffe4
	dw PUSH

	org 0xfffe
	dw RESET

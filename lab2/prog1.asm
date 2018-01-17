.include "msp430g2553.inc"

    org 0xC000
START:
    mov.w   #WDTPW|WDTHOLD, &WDTCTL
    mov.b   #0x41,          &P1DIR  ; #01000001b (P1.6 == LED2, P1.0 == LED1)
    mov.w   #0x01,          R8      ; #00000001b (start on LED1)
REPEAT:
    mov.b   R8,             &P1OUT
    xor.b   #0x41,          R8      ; #00000001b -> #01000000b -> ... (LED0 -> LED1 -> ...)
    mov.w   #40000,         R9      ; counts to decrement before blink
    mov.w   #40000,         R10     ; counts to decrement (2nd dec, since 16-bit max value is 65536)
WAITER1:
    dec     R9
    jnz     WAITER1         ; R9 not yet 0
WAITER2:
    dec     R10
    jnz     waiter2         ; R10 not yet 0
    jmp     repeat          ; R9, R10 == 0; blink other LED

    org 0xfffe
    dw      START           ; set reset vector to 'init' label
.include "msp430g2553.inc"

  org 0xC000
start:
  ;mov.w #0x5a80,       &WDTCTL
  mov.w #WDTPW|WDTHOLD, &WDTCTL
  mov.b #0x41,          &P1DIR    ; #01000001b (P1.6 == LED2, P1.0 == LED1)
  mov.w #0x01,          r8        ; #00000001b (start on LED1)
repeat:
  mov.b r8,     &P1OUT
  xor.b #0x41,  r8      ; #00000001b -> #01000000b -> ... (LED0 -> LED1 -> ...)
  mov.w #40000, r9      ; counts to decrement before blink
  mov.w #40000, r10     ; counts to decrement (2nd dec, since 16-bit max value is 65536)
waiter1:
  dec r9
  jnz waiter1           ; r9 not yet 0
waiter2:
  dec r10
  jnz waiter2           ; r10 not yet 0
  jmp repeat            ; r9, r10 == 0; blink other LED

  org 0xfffe
  dw  start             ; set reset vector to 'init' label


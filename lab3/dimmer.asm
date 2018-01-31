	.file	"dimmer.c"
.text
.Ltext0:
	.global	__mspabi_mpyi
	.global	__mspabi_divu
	.balign 2
	.global	main
	.type	main, @function
main:
.LFB0:
	.file 1 "dimmer.c"
	.loc 1 3 0
; start of function
; framesize_regs:     10
; framesize_locals:   2
; framesize_outgoing: 0
; framesize:          12
; elim ap -> fp       12
; elim fp -> sp       2
; saved regs: R6 R7 R8 R9 R10
	; start of prologue
	PUSH	R10
.LCFI0:
	PUSH	R9
.LCFI1:
	PUSH	R8
.LCFI2:
	PUSH	R7
.LCFI3:
	PUSH	R6
.LCFI4:
	SUB.W	#2, R1
.LCFI5:
	; end of prologue
	.loc 1 4 0
	MOV.W	#23168, &WDTCTL
	.loc 1 6 0
	MOV.W	#4112, &ADC10CTL0
	.loc 1 7 0
	MOV.W	#4096, &ADC10CTL1
	.loc 1 8 0
	BIS.B	#2, &ADC10AE0
	.loc 1 10 0
	BIS.B	#4, &P1DIR
	.loc 1 11 0
	BIS.B	#4, &P1SEL
	.loc 1 13 0
	MOV.W	#999, &TA0CCR0
	.loc 1 14 0
	MOV.W	#224, &TA0CCTL1
	.loc 1 15 0
	MOV.W	#250, &TA0CCR1
	.loc 1 16 0
	MOV.W	#528, &TA0CTL
	.loc 1 21 0
	MOV.W	#__mspabi_mpyi, R10
	MOV.W	#1000, R8
	MOV.W	#__mspabi_divu, R9
	MOV.W	#1023, R7
.LBB2:
	.loc 1 22 0
	MOV.W	#-1, R6
.L5:
.LBE2:
	.loc 1 19 0
	BIS.W	#3, &ADC10CTL0
.L2:
	.loc 1 20 0 discriminator 1
	BIT.W	#1, &ADC10CTL1 { JNE	.L2
	.loc 1 21 0
	MOV.W	R8, R13
	MOV.W	&ADC10MEM, R12
	CALL	R10
.LVL0:
	MOV.W	R7, R13
	CALL	R9
.LVL1:
	MOV.W	R12, &TA0CCR1
.LBB3:
	.loc 1 22 0
	MOV.W	R6, @R1
.L3:
	.loc 1 22 0 is_stmt 0 discriminator 1
	MOV.W	@R1, R12
	CMP.W	#0, R12 { JEQ	.L5
	.loc 1 22 0 discriminator 3
	ADD.W	#-1, @R1
	BR	#.L3
.LBE3:
.LFE0:
	.size	main, .-main
	.section	.debug_frame,"",@progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.string	""
	.uleb128 0x1
	.sleb128 -2
	.uleb128 0
	.byte	0xc
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x80
	.uleb128 0x1
	.balign 4
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x6
	.byte	0x89
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x8
	.byte	0x88
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0xa
	.byte	0x87
	.uleb128 0x5
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0xc
	.byte	0x86
	.uleb128 0x6
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0xe
	.balign 4
.LEFDE0:
.text
.Letext0:
	.file 2 "/home/jonathan/ti/msp430_gcc/include/msp430g2553.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4eb
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF98
	.byte	0xc
	.4byte	.LASF99
	.4byte	.LASF100
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	0x25
	.uleb128 0x4
	.string	"IE1"
	.byte	0x2
	.byte	0x8e
	.4byte	0x43
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	0x3c
	.uleb128 0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x94
	.4byte	0x43
	.uleb128 0x4
	.string	"IE2"
	.byte	0x2
	.byte	0x9b
	.4byte	0x43
	.uleb128 0x5
	.4byte	.LASF3
	.byte	0x2
	.byte	0xa2
	.4byte	0x43
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x2
	.byte	0xae
	.4byte	0x43
	.uleb128 0x5
	.4byte	.LASF5
	.byte	0x2
	.byte	0xaf
	.4byte	0x43
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0xb0
	.4byte	0x43
	.uleb128 0x5
	.4byte	.LASF7
	.byte	0x2
	.byte	0xb2
	.4byte	0x2c
	.uleb128 0x5
	.4byte	.LASF8
	.byte	0x2
	.byte	0xb3
	.4byte	0x2c
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x2
	.byte	0xb4
	.4byte	0x2c
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x2
	.byte	0xb5
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x2
	.2byte	0x11d
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x2
	.2byte	0x11e
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF13
	.byte	0x2
	.2byte	0x11f
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0x2
	.2byte	0x120
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x2
	.2byte	0x16d
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x2
	.2byte	0x16e
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x2
	.2byte	0x16f
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x196
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x2
	.2byte	0x197
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x198
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x2
	.2byte	0x1cc
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0x2
	.2byte	0x1cd
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x1ce
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x1cf
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x1d0
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x2
	.2byte	0x1d1
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x1d2
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x1d3
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x1d4
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x1d6
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF31
	.byte	0x2
	.2byte	0x1d7
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF32
	.byte	0x2
	.2byte	0x1d8
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF33
	.byte	0x2
	.2byte	0x1d9
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF34
	.byte	0x2
	.2byte	0x1da
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF35
	.byte	0x2
	.2byte	0x1db
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x2
	.2byte	0x1dc
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x2
	.2byte	0x1dd
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x2
	.2byte	0x1de
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x2
	.2byte	0x1e8
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x1e9
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x2
	.2byte	0x1ea
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x1eb
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF43
	.byte	0x2
	.2byte	0x1ec
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF44
	.byte	0x2
	.2byte	0x1ed
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF45
	.byte	0x2
	.2byte	0x1f4
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF46
	.byte	0x2
	.2byte	0x1f5
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF47
	.byte	0x2
	.2byte	0x1f6
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF48
	.byte	0x2
	.2byte	0x1f7
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF49
	.byte	0x2
	.2byte	0x1f8
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x1f9
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF51
	.byte	0x2
	.2byte	0x1fa
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF52
	.byte	0x2
	.2byte	0x1fb
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF53
	.byte	0x2
	.2byte	0x1fc
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF54
	.byte	0x2
	.2byte	0x265
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x266
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF56
	.byte	0x2
	.2byte	0x267
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF57
	.byte	0x2
	.2byte	0x268
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF58
	.byte	0x2
	.2byte	0x269
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF59
	.byte	0x2
	.2byte	0x26a
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF60
	.byte	0x2
	.2byte	0x26b
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF61
	.byte	0x2
	.2byte	0x26c
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x26d
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF63
	.byte	0x2
	.2byte	0x27e
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF64
	.byte	0x2
	.2byte	0x27f
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF65
	.byte	0x2
	.2byte	0x280
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF66
	.byte	0x2
	.2byte	0x281
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF67
	.byte	0x2
	.2byte	0x282
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF68
	.byte	0x2
	.2byte	0x283
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF69
	.byte	0x2
	.2byte	0x284
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF70
	.byte	0x2
	.2byte	0x285
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF71
	.byte	0x2
	.2byte	0x286
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF72
	.byte	0x2
	.2byte	0x287
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x288
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF74
	.byte	0x2
	.2byte	0x28c
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF75
	.byte	0x2
	.2byte	0x28d
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF76
	.byte	0x2
	.2byte	0x28e
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF77
	.byte	0x2
	.2byte	0x28f
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF78
	.byte	0x2
	.2byte	0x290
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF79
	.byte	0x2
	.2byte	0x291
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF80
	.byte	0x2
	.2byte	0x292
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF81
	.byte	0x2
	.2byte	0x293
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x294
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF83
	.byte	0x2
	.2byte	0x295
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF84
	.byte	0x2
	.2byte	0x341
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF85
	.byte	0x2
	.2byte	0x370
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF86
	.byte	0x2
	.2byte	0x371
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF87
	.byte	0x2
	.2byte	0x372
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF88
	.byte	0x2
	.2byte	0x373
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF89
	.byte	0x2
	.2byte	0x374
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF90
	.byte	0x2
	.2byte	0x375
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF91
	.byte	0x2
	.2byte	0x376
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF92
	.byte	0x2
	.2byte	0x377
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF93
	.byte	0x2
	.2byte	0x385
	.4byte	0x2c
	.uleb128 0x6
	.4byte	.LASF94
	.byte	0x2
	.2byte	0x386
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF95
	.byte	0x2
	.2byte	0x387
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF96
	.byte	0x2
	.2byte	0x388
	.4byte	0x43
	.uleb128 0x6
	.4byte	.LASF97
	.byte	0x2
	.2byte	0x389
	.4byte	0x43
	.uleb128 0x7
	.4byte	.LASF101
	.byte	0x1
	.byte	0x3
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.Ldebug_ranges0+0
	.uleb128 0x9
	.string	"i"
	.byte	0x1
	.byte	0x16
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB2-.Ltext0
	.4byte	.LBE2-.Ltext0
	.4byte	.LBB3-.Ltext0
	.4byte	.LBE3-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF32:
	.string	"P2DIR"
.LASF60:
	.string	"TA1CCR0"
.LASF61:
	.string	"TA1CCR1"
.LASF62:
	.string	"TA1CCR2"
.LASF69:
	.string	"UCA0RXBUF"
.LASF29:
	.string	"P1REN"
.LASF50:
	.string	"TA0R"
.LASF67:
	.string	"UCA0MCTL"
.LASF87:
	.string	"CALDCO_12MHZ"
.LASF79:
	.string	"UCB0STAT"
.LASF47:
	.string	"TA0CCTL0"
.LASF25:
	.string	"P1IES"
.LASF49:
	.string	"TA0CCTL2"
.LASF98:
	.string	"GNU C11 6.4.0 -mmcu=msp430g2553 -mdevices-csv-loc=/home/jonathan/ti/msp430_gcc/include/devices.csv -mdevices-csv-loc=/home/jonathan/ti/msp430_gcc/include/devices.csv -mcpu=msp430 -g -Os"
.LASF39:
	.string	"P3IN"
.LASF17:
	.string	"CAPD"
.LASF35:
	.string	"P2IE"
.LASF4:
	.string	"ADC10DTC0"
.LASF5:
	.string	"ADC10DTC1"
.LASF36:
	.string	"P2SEL"
.LASF40:
	.string	"P3OUT"
.LASF77:
	.string	"UCB0BR1"
.LASF93:
	.string	"TLV_CHECKSUM"
.LASF26:
	.string	"P1IE"
.LASF78:
	.string	"UCB0I2CIE"
.LASF63:
	.string	"UCA0CTL0"
.LASF64:
	.string	"UCA0CTL1"
.LASF41:
	.string	"P3DIR"
.LASF72:
	.string	"UCA0IRTCTL"
.LASF81:
	.string	"UCB0TXBUF"
.LASF15:
	.string	"CACTL1"
.LASF16:
	.string	"CACTL2"
.LASF7:
	.string	"ADC10CTL0"
.LASF8:
	.string	"ADC10CTL1"
.LASF37:
	.string	"P2SEL2"
.LASF24:
	.string	"P1IFG"
.LASF57:
	.string	"TA1CCTL1"
.LASF58:
	.string	"TA1CCTL2"
.LASF74:
	.string	"UCB0CTL0"
.LASF34:
	.string	"P2IES"
.LASF10:
	.string	"ADC10SA"
.LASF76:
	.string	"UCB0BR0"
.LASF9:
	.string	"ADC10MEM"
.LASF30:
	.string	"P2IN"
.LASF52:
	.string	"TA0CCR1"
.LASF42:
	.string	"P3SEL"
.LASF46:
	.string	"TA0CTL"
.LASF100:
	.string	"/home/jonathan/Documents/PHYS319/lab3"
.LASF1:
	.string	"unsigned char"
.LASF88:
	.string	"CALBC1_12MHZ"
.LASF54:
	.string	"TA1IV"
.LASF21:
	.string	"P1IN"
.LASF86:
	.string	"CALBC1_16MHZ"
.LASF68:
	.string	"UCA0STAT"
.LASF56:
	.string	"TA1CCTL0"
.LASF0:
	.string	"unsigned int"
.LASF44:
	.string	"P3REN"
.LASF80:
	.string	"UCB0RXBUF"
.LASF33:
	.string	"P2IFG"
.LASF12:
	.string	"BCSCTL1"
.LASF13:
	.string	"BCSCTL2"
.LASF14:
	.string	"BCSCTL3"
.LASF45:
	.string	"TA0IV"
.LASF2:
	.string	"IFG1"
.LASF3:
	.string	"IFG2"
.LASF99:
	.string	"dimmer.c"
.LASF101:
	.string	"main"
.LASF6:
	.string	"ADC10AE0"
.LASF51:
	.string	"TA0CCR0"
.LASF43:
	.string	"P3SEL2"
.LASF53:
	.string	"TA0CCR2"
.LASF22:
	.string	"P1OUT"
.LASF89:
	.string	"CALDCO_8MHZ"
.LASF55:
	.string	"TA1CTL"
.LASF18:
	.string	"FCTL1"
.LASF19:
	.string	"FCTL2"
.LASF20:
	.string	"FCTL3"
.LASF97:
	.string	"TLV_ADC10_1_LEN"
.LASF23:
	.string	"P1DIR"
.LASF75:
	.string	"UCB0CTL1"
.LASF96:
	.string	"TLV_ADC10_1_TAG"
.LASF48:
	.string	"TA0CCTL1"
.LASF11:
	.string	"DCOCTL"
.LASF71:
	.string	"UCA0ABCTL"
.LASF84:
	.string	"WDTCTL"
.LASF82:
	.string	"UCB0I2COA"
.LASF94:
	.string	"TLV_DCO_30_TAG"
.LASF65:
	.string	"UCA0BR0"
.LASF66:
	.string	"UCA0BR1"
.LASF95:
	.string	"TLV_DCO_30_LEN"
.LASF85:
	.string	"CALDCO_16MHZ"
.LASF91:
	.string	"CALDCO_1MHZ"
.LASF92:
	.string	"CALBC1_1MHZ"
.LASF83:
	.string	"UCB0I2CSA"
.LASF70:
	.string	"UCA0TXBUF"
.LASF27:
	.string	"P1SEL"
.LASF38:
	.string	"P2REN"
.LASF31:
	.string	"P2OUT"
.LASF90:
	.string	"CALBC1_8MHZ"
.LASF28:
	.string	"P1SEL2"
.LASF59:
	.string	"TA1R"
.LASF73:
	.string	"UCA0IRRCTL"
	.ident	"GCC: (SOMNIUM Technologies Limited - msp430-gcc 6.4.0.32) 6.4.0"

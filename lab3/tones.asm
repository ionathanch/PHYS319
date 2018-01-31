	.file	"tones.c"
.text
.Ltext0:
	.balign 2
	.global	show
	.type	show, @function
show:
.LFB0:
	.file 1 "tones.c"
	.loc 1 50 0
; start of function
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       2
; elim fp -> sp       0
; saved regs:(none)
.LVL0:
	; start of prologue
	; end of prologue
	.loc 1 51 0
	CMP.W	#720, R12 { JEQ	.L3
	MOV.W	#720, R13
	CMP.W	R12, R13 { JL	.L4
	CMP.W	#570, R12 { JEQ	.L5
	MOV.W	#570, R13
	CMP.W	R12, R13 { JL	.L6
	CMP.W	#500, R12 { JEQ	.L13
	CMP.W	#535, R12 { JEQ	.L5
.L2:
	.loc 1 73 0
	MOV.B	#0, R12
.LVL1:
	BR	#.L7
.LVL2:
.L6:
	.loc 1 51 0
	CMP.W	#625, R12 { JEQ	.L8
	CMP.W	#670, R12 { JEQ	.L3
	CMP.W	#600, R12 { JNE	.L2
.L8:
	.loc 1 68 0
	MOV.B	#160, R12
.LVL3:
	BR	#.L7
.LVL4:
.L4:
	.loc 1 51 0
	CMP.W	#850, R12 { JEQ	.L9
	MOV.W	#850, R13
	CMP.W	R12, R13 { JL	.L10
	CMP.W	#750, R12 { JEQ	.L11
	CMP.W	#800, R12 { JNE	.L2
.L9:
	.loc 1 60 0
	MOV.B	#224, R12
.LVL5:
	BR	#.L7
.LVL6:
.L10:
	.loc 1 51 0
	CMP.W	#950, R12 { JEQ	.L12
	CMP.W	#1000, R12 { JEQ	.L13
	CMP.W	#900, R12 { JNE	.L2
.L12:
	.loc 1 57 0
	MOV.B	#208, R12
.LVL7:
.L7:
	.loc 1 75 0
	; start of epilogue
	RET
.LVL8:
.L11:
	.loc 1 62 0
	MOV.B	#240, R12
.LVL9:
	BR	#.L7
.LVL10:
.L3:
	.loc 1 65 0
	MOV.B	#96, R12
.LVL11:
	BR	#.L7
.LVL12:
.L5:
	.loc 1 71 0
	MOV.B	#176, R12
.LVL13:
	BR	#.L7
.LVL14:
.L13:
	.loc 1 54 0
	MOV.B	#192, R12
.LVL15:
	BR	#.L7
.LFE0:
	.size	show, .-show
	.balign 2
	.global	acc
	.type	acc, @function
acc:
.LFB1:
	.loc 1 77 0
; start of function
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       2
; elim fp -> sp       0
; saved regs:(none)
.LVL16:
	; start of prologue
	; end of prologue
	.loc 1 78 0
	CMP.W	#625, R12 { JEQ	.L55
	MOV.W	#625, R13
	CMP.W	R12, R13 { JL	.L53
	CMP.W	#500, R12 { JEQ	.L54
	CMP.W	#570, R12 { JNE	.L51
.L55:
	.loc 1 84 0
	MOV.B	#241, R12
.LVL17:
	BR	#.L52
.LVL18:
.L53:
	.loc 1 78 0
	CMP.W	#850, R12 { JEQ	.L55
	CMP.W	#950, R12 { JEQ	.L55
	CMP.W	#720, R12 { JEQ	.L55
.L51:
	.loc 1 88 0
	MOV.B	#1, R12
.LVL19:
	BR	#.L52
.LVL20:
.L54:
	.loc 1 86 0
	MOV.B	#193, R12
.LVL21:
.L52:
	.loc 1 90 0
	; start of epilogue
	RET
.LFE1:
	.size	acc, .-acc
	.balign 2
	.global	sing
	.type	sing, @function
sing:
.LFB2:
	.loc 1 92 0
; start of function
; framesize_regs:     14
; framesize_locals:   10
; framesize_outgoing: 0
; framesize:          24
; elim ap -> fp       16
; elim fp -> sp       10
; saved regs: R4 R5 R6 R7 R8 R9 R10
.LVL22:
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
	PUSH	R5
.LCFI5:
	PUSH	R4
.LCFI6:
	SUB.W	#10, R1
.LCFI7:
	; end of prologue
	MOV.W	R12, 2(R1)
	MOV.W	R13, 4(R1)
.LBB2:
.LBB3:
	.loc 1 99 0
	MOV.W	#show, R6
	.loc 1 101 0
	MOV.W	#acc, R5
.LBB4:
.LBB5:
	.loc 1 105 0
	MOV.W	#20479, R4
.LVL23:
.L81:
	MOV.W	4(R1), R7
	MOV.W	2(R1), R8
.LBE5:
.LBE4:
.LBE3:
	.loc 1 94 0
	MOV.B	#0, R9
.LVL24:
.L72:
	.loc 1 94 0 is_stmt 0 discriminator 1
	CMP.W	R14, R9 { JGE	.L81
.LBB10:
	.loc 1 95 0 is_stmt 1
	MOV.W	@R8, R10
.LVL25:
	.loc 1 96 0
	CMP.W	#0, R10 { JEQ	.L73
	.loc 1 96 0 is_stmt 0 discriminator 1
	MOV.W	R10, R12
.L74:
	.loc 1 96 0 discriminator 4
	MOV.W	R12, &TA0CCR0
	.loc 1 97 0 is_stmt 1 discriminator 4
	CMP.W	#0, R10 { JNE	.L82
	.loc 1 97 0 is_stmt 0
	MOV.B	#0, R12
.L75:
	.loc 1 97 0 discriminator 4
	MOV.W	R12, &TA0CCR1
	.loc 1 99 0 is_stmt 1 discriminator 4
	MOV.W	R10, R12
	MOV.W	R14, @R1
	CALL	R6
.LVL26:
	MOV.B	R12, &P1OUT
	.loc 1 100 0 discriminator 4
	BIS.B	#8, &P1OUT
	.loc 1 101 0 discriminator 4
	MOV.W	R10, R12
	CALL	R5
.LVL27:
	MOV.B	R12, &P1OUT
	.loc 1 102 0 discriminator 4
	BIS.B	#8, &P1OUT
.LBB8:
	.loc 1 104 0 discriminator 4
	MOV.W	@R7, 6(R1)
	MOV.W	@R1, R14
.LVL28:
.L76:
	.loc 1 104 0 is_stmt 0 discriminator 1
	MOV.W	6(R1), R12
	CMP.W	#0, R12 { JNE	.L79
.LBE8:
.LBE10:
	.loc 1 94 0 is_stmt 1 discriminator 2
	ADD.W	#1, R9
.LVL29:
	ADD.W	#2, R7
	ADD.W	#2, R8
	BR	#.L72
.L73:
.LBB11:
	.loc 1 96 0 discriminator 2
	MOV.W	&TA0CCR0, R12
	BR	#.L74
.L82:
	.loc 1 97 0
	MOV.B	#100, R12
	BR	#.L75
.L79:
.LBB9:
.LBB6:
	.loc 1 105 0
	MOV.W	R4, 8(R1)
.L77:
	.loc 1 105 0 is_stmt 0 discriminator 1
	MOV.W	8(R1), R12
	CMP.W	#0, R12 { JNE	.L78
.LBE6:
	.loc 1 104 0 is_stmt 1 discriminator 2
	ADD.W	#-1, 6(R1)
	BR	#.L76
.L78:
.LBB7:
	.loc 1 105 0 discriminator 3
	ADD.W	#-1, 8(R1)
	BR	#.L77
.LBE7:
.LBE9:
.LBE11:
.LBE2:
.LFE2:
	.size	sing, .-sing
	.balign 2
	.global	clear
	.type	clear, @function
clear:
.LFB3:
	.loc 1 111 0
; start of function
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       2
; elim fp -> sp       0
; saved regs:(none)
	; start of prologue
	; end of prologue
	.loc 1 112 0
	MOV.B	#0, &P1OUT
	.loc 1 113 0
	MOV.B	#8, &P1OUT
	.loc 1 115 0
	MOV.B	#1, &P1OUT
	.loc 1 116 0
	MOV.B	#9, &P1OUT
	.loc 1 118 0
	MOV.B	#2, &P1OUT
	.loc 1 119 0
	MOV.B	#10, &P1OUT
	.loc 1 121 0
	MOV.B	#3, &P1OUT
	.loc 1 122 0
	MOV.B	#11, &P1OUT
	.loc 1 123 0
	; start of epilogue
	RET
.LFE3:
	.size	clear, .-clear
	.balign 2
	.global	main
	.type	main, @function
main:
.LFB4:
	.loc 1 125 0
; start of function
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       2
; elim fp -> sp       0
; saved regs:(none)
	; start of prologue
	; end of prologue
	.loc 1 126 0
	MOV.W	#23168, &WDTCTL
	.loc 1 128 0
	MOV.B	#-1, &P1DIR
	.loc 1 129 0
	BIS.B	#4, &P1SEL
	.loc 1 131 0
	MOV.W	#224, &TA0CCTL1
	.loc 1 132 0
	MOV.W	#528, &TA0CTL
	.loc 1 134 0
	CALL	#clear
.LVL30:
	.loc 1 135 0
	MOV.B	#30, R14
	MOV.W	#hbd_lengths, R13
	MOV.W	#hbd, R12
	CALL	#sing
.LVL31:
.LFE4:
	.size	main, .-main
	.global	scale_lengths
.data
	.balign 2
	.type	scale_lengths, @object
	.size	scale_lengths, 26
scale_lengths:
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.global	scale
	.balign 2
	.type	scale, @object
	.size	scale, 26
scale:
	.short	1000
	.short	950
	.short	900
	.short	850
	.short	800
	.short	750
	.short	720
	.short	670
	.short	625
	.short	600
	.short	570
	.short	535
	.short	500
	.global	hbd_lengths
	.balign 2
	.type	hbd_lengths, @object
	.size	hbd_lengths, 60
hbd_lengths:
	.short	1
	.short	1
	.short	1
	.short	3
	.short	3
	.short	3
	.short	6
	.short	1
	.short	1
	.short	1
	.short	3
	.short	3
	.short	3
	.short	6
	.short	1
	.short	1
	.short	1
	.short	3
	.short	3
	.short	3
	.short	3
	.short	4
	.short	1
	.short	1
	.short	1
	.short	3
	.short	3
	.short	3
	.short	6
	.short	3
	.global	hbd
	.balign 2
	.type	hbd, @object
	.size	hbd, 60
hbd:
	.short	1000
	.short	0
	.short	1000
	.short	900
	.short	1000
	.short	750
	.short	800
	.short	1000
	.short	0
	.short	1000
	.short	900
	.short	1000
	.short	670
	.short	750
	.short	1000
	.short	0
	.short	1000
	.short	500
	.short	600
	.short	750
	.short	800
	.short	900
	.short	570
	.short	0
	.short	570
	.short	600
	.short	750
	.short	670
	.short	750
	.short	0
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
	.balign 4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.balign 4
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI0-.LFB2
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
	.byte	0x85
	.uleb128 0x7
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x1a
	.balign 4
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.balign 4
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.balign 4
.LEFDE8:
.text
.Letext0:
	.file 2 "/home/jonathan/ti/msp430_gcc/include/msp430g2553.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x699
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF109
	.byte	0xc
	.4byte	.LASF110
	.4byte	.LASF111
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
	.4byte	0x4e1
	.4byte	0x4da
	.uleb128 0x8
	.4byte	0x4da
	.byte	0x1d
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF98
	.uleb128 0x9
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0xa
	.string	"hbd"
	.byte	0x1
	.byte	0x12
	.4byte	0x4ca
	.uleb128 0x5
	.byte	0x3
	.4byte	hbd
	.uleb128 0xb
	.4byte	.LASF99
	.byte	0x1
	.byte	0x1d
	.4byte	0x4ca
	.uleb128 0x5
	.byte	0x3
	.4byte	hbd_lengths
	.uleb128 0x7
	.4byte	0x4e1
	.4byte	0x51a
	.uleb128 0x8
	.4byte	0x4da
	.byte	0xc
	.byte	0
	.uleb128 0xb
	.4byte	.LASF100
	.byte	0x1
	.byte	0x29
	.4byte	0x50a
	.uleb128 0x5
	.byte	0x3
	.4byte	scale
	.uleb128 0xb
	.4byte	.LASF101
	.byte	0x1
	.byte	0x2c
	.4byte	0x50a
	.uleb128 0x5
	.byte	0x3
	.4byte	scale_lengths
	.uleb128 0xc
	.4byte	.LASF102
	.byte	0x1
	.byte	0x7d
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x57c
	.uleb128 0xd
	.4byte	.LVL30
	.4byte	0x57c
	.uleb128 0xe
	.4byte	.LVL31
	.4byte	0x58d
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x5
	.byte	0x3
	.4byte	hbd
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x5d
	.uleb128 0x5
	.byte	0x3
	.4byte	hbd_lengths
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x5e
	.uleb128 0x1
	.byte	0x4e
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF112
	.byte	0x1
	.byte	0x6f
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF103
	.byte	0x1
	.byte	0x5c
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x648
	.uleb128 0x11
	.4byte	.LASF104
	.byte	0x1
	.byte	0x5c
	.4byte	0x648
	.4byte	.LLST2
	.uleb128 0x11
	.4byte	.LASF105
	.byte	0x1
	.byte	0x5c
	.4byte	0x648
	.4byte	.LLST3
	.uleb128 0x11
	.4byte	.LASF106
	.byte	0x1
	.byte	0x5c
	.4byte	0x4e1
	.4byte	.LLST4
	.uleb128 0x12
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x13
	.string	"i"
	.byte	0x1
	.byte	0x5e
	.4byte	0x4e1
	.4byte	.LLST5
	.uleb128 0x14
	.4byte	.Ldebug_ranges0+0
	.uleb128 0x15
	.4byte	.LASF107
	.byte	0x1
	.byte	0x5f
	.4byte	0x4e1
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x16
	.4byte	.Ldebug_ranges0+0x20
	.4byte	0x621
	.uleb128 0x15
	.4byte	.LASF106
	.byte	0x1
	.byte	0x68
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.Ldebug_ranges0+0x40
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.byte	0x69
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LVL26
	.4byte	0x677
	.4byte	0x635
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x7a
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.4byte	.LVL27
	.4byte	0x64e
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x5c
	.uleb128 0x2
	.byte	0x7a
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.byte	0x2
	.4byte	0x4e1
	.uleb128 0x1a
	.string	"acc"
	.byte	0x1
	.byte	0x4d
	.4byte	0x3c
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x677
	.uleb128 0x11
	.4byte	.LASF107
	.byte	0x1
	.byte	0x4d
	.4byte	0x4e1
	.4byte	.LLST1
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF108
	.byte	0x1
	.byte	0x32
	.4byte	0x3c
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF107
	.byte	0x1
	.byte	0x32
	.4byte	0x4e1
	.4byte	.LLST0
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST2:
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL23-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -24
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL23-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -22
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL26-1-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL26-1-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x5e
	.byte	0x9f
	.4byte	.LVL28-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL24-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL21-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL15-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
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
	.4byte	.LBB3-.Ltext0
	.4byte	.LBE3-.Ltext0
	.4byte	.LBB10-.Ltext0
	.4byte	.LBE10-.Ltext0
	.4byte	.LBB11-.Ltext0
	.4byte	.LBE11-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB4-.Ltext0
	.4byte	.LBE4-.Ltext0
	.4byte	.LBB8-.Ltext0
	.4byte	.LBE8-.Ltext0
	.4byte	.LBB9-.Ltext0
	.4byte	.LBE9-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB5-.Ltext0
	.4byte	.LBE5-.Ltext0
	.4byte	.LBB6-.Ltext0
	.4byte	.LBE6-.Ltext0
	.4byte	.LBB7-.Ltext0
	.4byte	.LBE7-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF101:
	.string	"scale_lengths"
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
.LASF108:
	.string	"show"
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
.LASF109:
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
.LASF99:
	.string	"hbd_lengths"
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
.LASF112:
	.string	"clear"
.LASF71:
	.string	"UCA0ABCTL"
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
.LASF103:
	.string	"sing"
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
.LASF111:
	.string	"/home/jonathan/Documents/PHYS319/lab3"
.LASF106:
	.string	"length"
.LASF1:
	.string	"unsigned char"
.LASF88:
	.string	"CALBC1_12MHZ"
.LASF105:
	.string	"song_lengths"
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
.LASF59:
	.string	"TA1R"
.LASF102:
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
.LASF107:
	.string	"note"
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
.LASF104:
	.string	"song"
.LASF48:
	.string	"TA0CCTL1"
.LASF11:
	.string	"DCOCTL"
.LASF110:
	.string	"tones.c"
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
.LASF98:
	.string	"sizetype"
.LASF85:
	.string	"CALDCO_16MHZ"
.LASF91:
	.string	"CALDCO_1MHZ"
.LASF92:
	.string	"CALBC1_1MHZ"
.LASF83:
	.string	"UCB0I2CSA"
.LASF100:
	.string	"scale"
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
.LASF73:
	.string	"UCA0IRRCTL"
	.ident	"GCC: (SOMNIUM Technologies Limited - msp430-gcc 6.4.0.32) 6.4.0"

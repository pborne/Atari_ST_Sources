

	MOVE.W	#$20,-(A7)
	TRAP #1
	MOVE.L	D0,PILE

	MOVE.W	#$2700,SR	
	BCLR.B	#0,$484
	MOVE.B	$FFFFFA09.W,S9
	MOVE.B	$FFFFFA07.W,S7
	MOVE.L	$70,S70
	MOVE.L	#PAULA,$70
	MOVE.B	#0,$FFFFFA09.W
	MOVE.B	#0,$FFFFFA07.W
	MOVE.W	#$2300,SR	

NIET	CMP.B	#$39,$FFFC02
	BNE.S	NIET

	MOVE.W	#$2700,SR	
	MOVE.L	S70,$70
	MOVE.B	S9,$FFFFFA09.W
	MOVE.B	S7,$FFFFFA07.W
	MOVE.W	#$2300,SR	
	
	MOVE.L	PILE,D0
	MOVE.W	#$20,-(A7)
	TRAP #1

	MOVE.L	#0,-(A7) 
	TRAP #1
PILE	DC.L	0
S70	DC.L	0
S9	DC.B	0
S7	DC.B	0


PAULA
	MOVEM.L	D0-D3/A0-A1,-(A7)
	;MOVE.L	#160*20-28,D0
WAIT	;DBF	D0,WAIT
	LEA	BUF,A0
	LEA	BUF+4,A1
	LEA	BUF+8,A2
	LEA	BUF+12,A3
	MOVE.L	#$A123,D0
	MOVEQ	#0,D1
	MOVEQ	#0,D2
	MOVE.L	#BUF,D3
	MOVE.W	#7,$FF8240
	MOVE.W	#7,$FF8244
	BSR	ICI

	LEA	BUF,A0
	LEA	BUF+4,A1
	LEA	BUF+8,A2
	LEA	BUF+12,A3
	MOVE.L	#$A123,D0
	MOVEQ	#0,D1
	MOVEQ	#0,D2
	MOVE.L	#BUF,D3
	ADD.W	#$111,$FF8240
	ADD.W	#$111,$FF8244
	BSR	ICI

	LEA	BUF,A0
	LEA	BUF+4,A1
	LEA	BUF+8,A2
	LEA	BUF+12,A3
	MOVE.L	#$A123,D0
	MOVEQ	#0,D1
	MOVEQ	#0,D2
	MOVE.L	#BUF,D3	
	ADD.W	#$111,$FF8240
	ADD.W	#$111,$FF8244
	BSR	ICI2
	
	LEA	BUF,A0
	LEA	BUF+4,A1
	LEA	BUF+8,A2
	LEA	BUF+12,A3
	MOVE.L	#$A123,D0
	MOVEQ	#0,D1
	MOVEQ	#0,D2
	MOVE.L	#BUF,D3
	ADD.W	#$111,$FF8240
	ADD.W	#$111,$FF8244
	BSR	ICI2

	;LEA	BUF,A1
	;ADD.W	#$111,$FF8240
	;ADD.W	#$111,$FF8244
	;BSR	ICI

	;LEA	BUF,A1
	;ADD.W	#$111,$FF8240
	;ADD.W	#$111,$FF8244
	;BSR	ICI

	;LEA	BUF,A1
	;ADD.W	#$111,$FF8240
	;ADD.W	#$111,$FF8244
	;BSR	ICI

	;LEA	BUF,A1
	;ADD.W	#$111,$FF8240
	;ADD.W	#$111,$FF8244
	;BSR	ICI

	MOVE.W	#$777,$FF8240
	MOVE.W	#$70,$FF8244
	MOVEM.L	(A7)+,D0-D3/A0-A1
	RTE

ICI	REPT	$1F2
	SUB.W	D0,D1
	ADDX.W 	D2,D3
 	MOVE.B	0(A0,D3.W),D3 
	MOVE.L	D3,A2
	MOVE.B	(A2),2(A1)
	ENDR
	RTS
ICI2	REPT	$1F2
	SUB.W	D0,D1
	ADDX.W 	D2,D3
 	MOVE.B	0(A0,D3.W),D3 
	MOVE.L	D3,A2
	MOVE.B	(A2),D4
	ADD.B	D4,2(A1)
	ENDR
	RTS
 
BUF	DS.B	$1F2*2



***************************************************************************
*                                                                         *
*     BACK BY DOPE DEMAND INTRO V1.0 - WRITTEN BY LETHAL OF HOTLINE!      *
*                                                                         *
***************************************************************************

TEXTCODE=$00

	SECTION TEXT

	OPT O+,OW-

SAVECOL	MOVE.L $4(A7),BASE1

	DC.W $A00A

	MOVE.W #$2,-(SP)
	TRAP #$0E
	ADDQ.L #$2,SP
	MOVE.L D0,PHYSBASE+2

	MOVE.W #$3,-(SP)
	TRAP #$0E
	ADDQ.L #$2,SP
	MOVE.L D0,LOGBASE+2

	MOVE.W #$4,-(SP)
	TRAP #$0E
	ADDQ.L #$2,SP
	MOVE.W D0,REZ+2

	CLR.W -(SP)
	MOVE.L PHYSBASE+2(PC),-(SP)
	MOVE.L (SP),-(SP)
	MOVE.W #$5,-(SP)
	TRAP #$0E
	LEA $C(SP),SP

	PEA IRQ_SET
	MOVE.W #$26,-(SP)
	TRAP #$E
	ADDQ.L #$6,SP

REZ	MOVE.W #$0,-(SP)
PHYSBASE	MOVE.L #$48544C21,-(SP)
LOGBASE	MOVE.L #$4C4F4821,-(SP)
	MOVE.W #$5,-(SP)
	TRAP #$0E
	LEA $C(SP),SP

	MOVE.L BASE1,A5
	LEA GAME(PC),A3
	MOVE.L $2(A3),A0
	ADD.L $6(A3),A0
	MOVE.L A0,BASE2
	ADD.L A3,A0
	LEA $1C(A0),A0
	MOVE.L $8(A5),D0
	LEA GAME+$1C,A1
	TST.L (A0)
	BEQ.S QUIT
	ADD.L (A0)+,A1
NEXT1	ADD.L D0,(A1)
NEXT2	CLR.L D1
	MOVE.B (A0)+,D1
	TST.W D1
	BEQ.S QUIT
	CMP.B #$1,D1
	BNE.S NEXT3
	LEA $FE(A1),A1
	BRA.S NEXT2

NEXT3	ADD.L D1,A1
	BRA.S NEXT1

QUIT	MOVE.L $2(A3),$C(A5)
	MOVE.L $6(A3),$14(A5)
	MOVE.L $A(A3),$1C(A5)
	MOVE.L $8(A5),D0
	MOVE.L $C(A5),D1
	ADD.L D0,D1
	MOVE.L D1,$10(A5)
	MOVE.L $14(A5),D0
	ADD.L D0,D1
	MOVE.L D1,$18(A5)

	LEA COPY(PC),A0
	LEA $7FF00,A1
	MOVE.L A1,A5
	MOVEQ #$2F,D0
COPY_SET	MOVE.B (A0)+,(A1)+
	DBF D0,COPY_SET

	LEA GAME+$1C(PC),A0
	MOVE.L BASE1,A1
	LEA $100(A1),A1
	MOVE.L A1,A3
	MOVE.L BASE2,A4
	ADD.L A1,A4
	MOVE.L #EOF,A2
	JMP (A5)

COPY	MOVE.L (A0)+,(A1)+
	CMP.L A2,A0
	BLT.S COPY

CLEAR	CLR.L (A4)+
	CMP.L A2,A4
	BLT.S CLEAR
	DC.W $A009
	JMP (A3)

GAME	INCBIN FILE.PRG

	EVEN

IRQ_SET	MOVE.W #$5,-(SP)
	MOVE.W #$1A,-(SP)
	TRAP #$0E
	ADDQ.L #$4,SP

	MOVE.W #$6,-(SP)
	MOVE.W #$1A,-(SP)
	TRAP #$0E
	ADDQ.L #$4,SP

	MOVE.W SR,STATUS+2
	MOVE.W #$2700,SR

	MOVEM.L $FFFF8240.W,D0-D7
	MOVEM.L D0-D7,SAVECOL
	MOVE.B $FFFFF820A.W,HZ
	MOVE.B #$02,$FFFF820A.W

	MOVEM.L COLORS0,D0-D7
	MOVEM.L D0-D7,$FFFF8240.W

	LEA SCREEN,A0
	MOVE.L PHYSBASE+2,A1
	LEA $7D00(A1),A2
SCREENCOPY	MOVE.L (A0)+,(A1)+
	MOVE.W (A0)+,(A1)+
	CLR.W (A1)+
	CMP.L A1,A2
	BNE.S SCREENCOPY

	MOVE.L $120.W,OLDRASTER+2
	MOVE.L $70.W,OLDLEVEL4+2
	LEA $FFFFFA00.W,A0
	LEA OLDPHER,A1
	MOVE.B $07(A0),(A1)+
	MOVE.B $09(A0),(A1)+
	MOVE.B $0F(A0),(A1)+
	MOVE.B $11(A0),(A1)+
	MOVE.B $1B(A0),(A1)+
	AND.B #$DF,$FFFFFA09.W
	AND.B #$FE,$FFFFFA07.W
	MOVE.L #RASTERA,$120.W
	MOVE.L #LEVEL4A,$70.W
	OR.B #1,$07(A0)
	OR.B #1,$13(A0)

	MOVEQ #$0,D0
	BSR MUSIC
	BSR MUSIC+18

	MOVE.B #$12,$FFFFFC02.W

	MOVE.W #$2300,SR

DOPEWAIT	TST.B SYNC
	BEQ.S DOPEWAIT
	CLR.B SYNC
	CMP.B #$39,$FFFFFC02.W
	BEQ.S GONE
	TST.B DOPECOUNT2
	BEQ.S DOPEWAIT

GONE	MOVE.W SR,STATUS2+2
	MOVE.W #$2700,SR
	MOVE.L #LEVEL4B,$70.W
	MOVE.L #RASTERB,$120.W

	MOVE.L PHYSBASE+2,A0
	MOVE.W #$1F3F,D0
CLEARSCREEN	CLR.L (A0)+
	DBF D0,CLEARSCREEN

	LEA LOGO,A0
	MOVE.L PHYSBASE+2,A1
	MOVE.L A1,A2
	ADD.L #40*$A0,A2
	MOVE.L A2,A4
	MOVE.W #$117F,D0
LOGOCOPY	MOVE.B (A0)+,(A1)+
	DBF D0,LOGOCOPY

	LEA FONTTEXT,A1

NEXT_FONTER	LEA FONTLETTERS,A0
	LEA FONT,A3
	MOVE.B (A1)+,D0
	EOR.B #TEXTCODE,D0
	TST.B D0
	BEQ ENDER
	CMP.B #$D,D0
	BEQ RETURNFOUND
NEXT_FONT	MOVE.B (A0)+,D1
	CMP.B D0,D1
	BEQ.S FONTFOUND
	LEA $14(A3),A3
	BRA.S NEXT_FONT

RETURNFOUND	LEA 11*$A0(A4),A4
	MOVE.L A4,A2
	CLR.W FONTHELP
	BRA.S NEXT_FONTER

FONTFOUND	MOVE.B (A3)+,(A2)
	MOVE.B (A3)+,$2(A2)
	MOVE.B (A3)+,$A0(A2)
	MOVE.B (A3)+,$A2(A2)
	MOVE.B (A3)+,2*$A0(A2)
	MOVE.B (A3)+,2*$A0+2(A2)
	MOVE.B (A3)+,3*$A0(A2)
	MOVE.B (A3)+,3*$A0+2(A2)
	MOVE.B (A3)+,4*$A0(A2)
	MOVE.B (A3)+,4*$A0+2(A2)
	MOVE.B (A3)+,5*$A0(A2)
	MOVE.B (A3)+,5*$A0+2(A2)
	MOVE.B (A3)+,6*$A0(A2)
	MOVE.B (A3)+,6*$A0+2(A2)
	MOVE.B (A3)+,7*$A0(A2)
	MOVE.B (A3)+,7*$A0+2(A2)
	MOVE.B (A3)+,8*$A0(A2)
	MOVE.B (A3)+,8*$A0+2(A2)
	MOVE.B (A3)+,9*$A0(A2)
	MOVE.B (A3)+,9*$A0+2(A2)
	TST.W FONTHELP
	BNE.S NOT_EVEN
	NOT.W FONTHELP
	ADDQ.L #$1,A2
	BRA NEXT_FONTER
NOT_EVEN	ADDQ.L #$7,A2
	NOT.W FONTHELP
	BRA NEXT_FONTER

ENDER	
STATUS2	MOVE.W #$2700,SR

KEY	TST.B SYNC
	BEQ.S KEY
	CLR.B SYNC
;	CMP.B #$14,$FFFFFC02.W
;	BEQ.S TRAINER
	CMP.B #$39,$FFFFFC02.W
	BNE.S KEY
;	BRA.S NO_TR

;TRAINER	MOVE.W #$6004,GAME+$1C
 
NO_TR	MOVE.W #$2700,SR
	MOVE.B #$08,$FFFFFC02.W
	LEA $FFFFFA00.W,A0
	LEA OLDPHER,A1
	MOVE.B (A1)+,$07(A0)
	MOVE.B (A1)+,$09(A0)
	MOVE.B (A1)+,$0F(A0)
	MOVE.B (A1)+,$11(A0)
	MOVE.B (A1)+,$1B(A0)
OLDRASTER	MOVE.L #$12345678,$120.W
OLDLEVEL4	MOVE.L #$524F4E21,$70.W

	MOVEQ #-1,D0
	BSR MUSIC
	BSR MUSIC+22

	MOVEM.L SAVECOL,D0-D7
	MOVEM.L D0-D7,$FFFF8240.W
	MOVE.B HZ,$FFFF820A.W

STATUS	MOVE.W #$2700,SR

	MOVE.W #$5,-(SP)
	MOVE.W #$1B,-(SP)
	TRAP #$0E
	ADDQ.L #$4,SP

	MOVE.W #$6,-(SP)
	MOVE.W #$1B,-(SP)
	TRAP #$0E
	ADDQ.L #$4,SP
	RTS

LEVEL4A	MOVE.W #$2500,SR
	CLR.B $FFFFFA1B.W
	MOVE.B #$1,$FFFFFA21.W
	MOVE.B #$8,$FFFFFA1B.W
	CLR.W RASTER
	MOVEM.L D0-A6,-(SP)
	TST.B DOPECOUNT1
	BNE.S OUTFADE
	BSR COLORROL
	BRA.S OVEROUTFADE
OUTFADE	BSR OUTFADER	
OVEROUTFADE	MOVEM.L (SP)+,D0-A6
	MOVE.B #$1,SYNC
	RTE

COLORROL	ADDQ.W #$1,ROLCOUNTER
	CMP.W #$7,ROLCOUNTER
	BEQ.S ROLLER1
	RTS

ROLLER1	CLR.W ROLCOUNTER
	CMP.W #7,COLORCOUNT1
	BEQ.S ROLLER2
	ADDQ.W #$1,COLORCOUNT1
	RTS

ROLLER2	CMP.W #7,COLORCOUNT2
	BEQ.S ROLLER3
	ADDQ.W #$1,COLORCOUNT2
	RTS

ROLLER3	CMP.W #7,COLORCOUNT3
	BEQ.S ROLLER4
	ADDQ.W #$1,COLORCOUNT3
	RTS

ROLLER4	CMP.W #7,COLORCOUNT4
	BEQ.S ROLLER5
	ADDQ.W #$1,COLORCOUNT4
	RTS

ROLLER5	CLR.W ROLCOUNTER
	MOVE.B #$1,DOPECOUNT1
	RTS

OUTFADER	ADDQ.W #$1,ROLCOUNTER
	CMP.W #$7,ROLCOUNTER
	BEQ.S OUTFADER1
	RTS

OUTFADER1	CLR.W ROLCOUNTER
	TST.W COLORCOUNT1
	BEQ.S ENDOUTFADER
	SUBQ.W #$1,COLORCOUNT1
	SUBQ.W #$1,COLORCOUNT2
	SUBQ.W #$1,COLORCOUNT3
	SUBQ.W #$1,COLORCOUNT4
	RTS

ENDOUTFADER	MOVE.B #$1,DOPECOUNT2
	RTS

RASTERA	MOVEM.L D0-D3/A0,-(SP)
	ADDQ.W #$1,RASTER
	CMP.W #40,RASTER
	BGT.S TWO
	MOVE.W COLORCOUNT1,D0
	BRA.S RASTEREND

TWO	CMP.W #100,RASTER
	BGT.S THREE
	MOVE.W COLORCOUNT2,D0
	BRA.S RASTEREND

THREE	CMP.W #160,RASTER
	BGT.S FOUR
	MOVE.W COLORCOUNT3,D0
	BRA.S RASTEREND

FOUR	MOVE.W COLORCOUNT4,D0

RASTEREND	LSL.W #$5,D0
	LEA COLORS0,A0
	LEA (A0,D0.L),A0
	MOVEM.L (A0),D0-D3
	MOVEM.L D0-D3,$FFFF8240.W
	MOVEM.L (SP)+,D0-D3/A0
	BCLR #0,$FFFFFA0F.W
	RTE

LEVEL4B	MOVE.W #$2500,SR
	CLR.B $FFFFFA1B.W
	MOVE.B #$1,$FFFFFA21.W
	MOVE.B #$8,$FFFFFA1B.W
	MOVEM.L D0-A6,-(SP)
	MOVEM.L LETHALCOL,D0-D7
	MOVEM.L D0-D7,$FFFF8240.W
	BSR MUSIC+26
	MOVEM.L (SP)+,D0-A6
	MOVE.B #$1,SYNC
	RTE

RASTERB	BCLR #0,$FFFFFA0F.W
	RTE

	SECTION DATA

FONTTEXT	DC.B "                STEIGAR +",$D,$D
	DC.B "      CRACKED BY LETHAL OF HOTLINE",$D,$D,$D
;	DC.B "       DONE BY LETHAL OF HOTLINE!",$D,$D,$D

	DC.B "   GREETINGS TO THE FOLLOWING PEOPLE:",$D,$D
	DC.B "    THE REPLICANTS - THE MEDWAY BOYS",$D
	DC.B "      HAL - LOST BOYS - AUTOMATION",$D,$D

	DC.B "        INTRO CODING BY : LETHAL",$D
	DC.B "  MUSIC BY: LOTUS - GRAPHICS BY: SENCE",$D,$D

	DC.B "      SMASH YOUR SPACEBAR TO START",0
;	DC.B "         PRESS 'T' FOR TRAINER!",0

FONTLETTERS	DC.B "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!?",$22
	DC.B ".,':;-+() ",0

	EVEN

COLORS0	DC.W $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	DC.W $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
COLORS1	DC.W $0000,$0000,$0000,$0000,$0000,$0000,$0001,$0000
	DC.W $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
COLORS2	DC.W $0000,$0000,$0000,$0000,$0000,$0001,$0012,$0000
	DC.W $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
COLORS3	DC.W $0000,$0000,$0000,$0000,$0001,$0012,$0123,$0000
	DC.W $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
COLORS4	DC.W $0000,$0000,$0000,$0001,$0012,$0123,$0234,$0000
	DC.W $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
COLORS5	DC.W $0000,$0000,$0001,$0012,$0123,$0234,$0345,$0000
	DC.W $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
COLORS6	DC.W $0000,$0001,$0012,$0123,$0234,$0345,$0456,$0000
	DC.W $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
COLORS7	DC.W $0000,$0012,$0123,$0234,$0345,$0456,$0567,$0000
	DC.W $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
LETHALCOL	DC.W $0000,$0566,$0344,$0122,$0232,$0121,$0010,$0565
	DC.W $0454,$0343,$0000,$0000,$0000,$0000,$0000,$0676

SCREEN	INCBIN A:\DOPE\DOPE_INT.SCR
FONT	INCBIN A:\DOPE\DOPE_INT.FNT
MUSIC	INCBIN A:\DOPE\DOPE_INT.MUS
LOGO	INCBIN A:\DOPE\DOPE_INT.LOG

	SECTION BSS

	EVEN

BASE1	DS.L 1
BASE2	DS.L 1
RASTER	DS.W 1
COLORCOUNT1	DS.W 1
COLORCOUNT2	DS.W 1
COLORCOUNT3	DS.W 1
COLORCOUNT4	DS.W 1
ROLCOUNTER	DS.W 1
FONTHELP	DS.W 1
DOPECOUNT1	DS.B 1
DOPECOUNT2	DS.B 1
OLDPHER	DS.B 5
SYNC	DS.B 1
HZ	DS.B 1

EOF
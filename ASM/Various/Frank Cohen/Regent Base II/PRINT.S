
* Graphics Dump to Brother Twinriter 5
* by Frank Cohen
* (c) 1989 Regent Software

START MOVE #3,-(A7)  ;SCREEN LOCATION
 TRAP #14
 ADD #2,A7
 MOVE.L D0,SCREEN

 LEA FILENAME,A0
 JSR F_OPEN
 MOVE D0,FHANDLE
 MOVE FHANDLE,A0
 MOVE.L #34,D0
 MOVE.L SCREEN,A1
 JSR F_READ
 MOVE FHANDLE,A0
 MOVE.L #32000,D0
 MOVE.L SCREEN,A1
 JSR F_READ
 MOVE FHANDLE,A0
 JSR F_CLOSE

 MOVE.L SCREEN,A3

LINE_LOOP MOVE #3999,D0
 LEA OUTPUT,A0
LL_100 MOVE.B #0,(A0)+
 DBF D0,LL_100

 LEA OUTPUT,A4
 MOVE.B #27,(A4)+
 MOVE.B #3,(A4)+

 MOVE.B #27,(A4)+
 MOVE.B #$1E,(A4)+
 MOVE.B #2,(A4)+

 MOVE.B #27,(A4)+
 MOVE.B #'z',(A4)+
 MOVE.B #$80,(A4)+
 MOVE.B #$2,(A4)+

 MOVE #79,D4
MINI_LOOP MOVE #1,D2
HELIOS MOVE #7,D3
 CLR D0
SET_AGAIN ASL #1,D0

 MOVE.B (A3),D1
 ASL.B D2,D1
 BCC NO_SET
 OR #1,D0

NO_SET ADD.L #80,A3
 DBF D3,SET_AGAIN

 MOVE.B D0,(A4)+
 SUB.L #8*80,A3
 ADD #1,D2
 CMP #9,D2
 BNE HELIOS

 ADD.L #1,A3
 DBF D4,MINI_LOOP
 ADD.L #560,A3

 MOVE.B #10,(A4)+
 MOVE.B #10,(A4)+
 MOVE.B #10,(A4)+
 MOVE.B #10,(A4)+
 MOVE.B #27,(A4)+
 MOVE.B #4,(A4)+
 MOVE.B #13,(A4)+

 MOVE.L A4,D0
 SUB.L #OUTPUT,D0
 MOVE D0,LENGTH

 MOVE.L A3,-(A7)
 JSR SEND_LINE
 MOVE.L (A7)+,A3

 ADD #1,COUNT
 CMP #50,COUNT
 BNE LINE_LOOP
 JMP QUIT

*Anchor Escrow, Sue, Noreen Scott 434 4437

SEND_LINE LEA OUTPUT,A4

DOPR99 MOVE #11,-(A7)  ;UNDO KEY PRESSED?
 TRAP #1
 ADD #2,A7
 TST.B D0
 BEQ DOPR98
 MOVE #7,-(A7)
 TRAP #1
 ADD #2,A7
 SWAP D0
 CMP #97,D0
 BEQ QUIT
DOPR98 MOVE #17,-(A7) ;PRINTER STATUS
 TRAP #1
 ADD.L #2,A7
 TST.B D0
 BEQ DOPR99

 CLR D0
 MOVE.B (A4)+,D0
 MOVE D0,-(A7)   ;PRINTER PORT
 MOVE #5,-(A7)
 TRAP #1
 ADD.L #4,A7

 SUB #1,LENGTH
 TST LENGTH
 BPL DOPR99

 RTS

QUIT CLR -(A7)
 TRAP #1

WAIT_KEY MOVE #7,-(A7)
 TRAP #1
 ADD.L #2,A7
 RTS

STRING MOVE.L A0,-(A7)
 MOVE #9,-(A7)
 TRAP #1
 ADD #6,A7
 RTS

**************************
* OPEN DISK FILE         *
* A0 POINTS TO FILE NAME *
* D0 RETURNS HANDLE      *
**************************

F_OPEN MOVE #0,-(A7)
 MOVE.L A0,-(A7)
 MOVE #$3D,-(A7)
 TRAP #1
 ADD.L #8,A7
 RTS

*************************
* READ DISK FILE        *
* A0 = FILE HANDLE      *
* A1 = WHERE TO LOAD IT *
* D0 = NUMBER OF BYTES  *
*************************

F_READ MOVE.L A1,-(A7)
 MOVE.L D0,-(A7)
 MOVE A0,-(A7)
 MOVE #$3F,-(A7)
 TRAP #1
 ADD.L #12,A7
 RTS

*********************
* CLOSE DISK FILE   *
* A0 = FILE HANDLE  *
* D0 = ERROR CODE   *
*********************

F_CLOSE MOVE A0,-(A7)
 MOVE #$3E,-(A7)
 TRAP #1
 ADD.L #4,A7
 RTS

FILENAME DC.B 'C:\DUMPIT.PI3',0
SENDINGMES DC.B 'Sending to printer...',13,10,0
 EVEN

 BSS

FHANDLE DS 1
LENGTH DS 1
SCREEN DS.L 1
COUNT DS 1
OUTPUT DS.B 4000

 END


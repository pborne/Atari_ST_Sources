;       ACIA KEYBOARD HARDWARE JOY READ ROUTINE         7/25

        BSS
;                       ***** JOY HANDLER BSS *****
        ALIGN
        DS.B    2
JOY0    DS.B    1
JOY1    DS.B    1
ACIADAT = $FFFC02
ACIACTL = $FFFC00

        TEXT
        CLR.L   -(SP)
        MOVE    #$20,-(SP)
        TRAP    #1
        ADDQ.L  #6,SP
        MOVE.B  #0,$FFFA07
        MOVE.B  #0,$FFFA09      ; KILL KBD IERB
        MOVE.B  #0,$FFFA13
        MOVE.B  #0,$FFFA15      ;       IMRB
        MOVE.B  #$15,ACIADAT    ; KILL AUTO JOY
        MOVE.B  #$12,D0         ; KILL MOUSE
        JSR     XMT
        MOVE.B  #$15,D0         ; KILL JOY
        JSR     XMT

TESTLOOP:
        JSR     JOY
        MOVE.L  JOY0-2,D0
        JSR     SHOWD0
        JMP     TESTLOOP

showd0:
  movem.l d0-d7/a0-a6,-(sp)
  move.l d0,d2          ; display long word in d0
  jsr hex2asci
  move.b d0,adr+7
  move.b d1,adr+6
  asr.l #8,d2
  move.l d2,d0
  jsr hex2asci
  move.b d0,adr+5
  move.b d1,adr+4
  asr.l #8,d2
  move.l d2,d0
  jsr hex2asci
  move.b d0,adr+3
  move.b d1,adr+2
  asr.l #8,d2
  move.l d2,d0
  jsr hex2asci
  move.b d0,adr+1
  move.b d1,adr
        MOVE.L  #STR,-(SP)
        MOVE    #9,-(SP)
        TRAP    #1
        ADD.L   #6,SP
  movem.l (sp)+,d0-d7/a0-a6
  rts

hex2asci:               ; hex in d0 to ascii in d0(low) d1(high)
  move.b d0,d1
  and.b #$f,d0
  cmp.b #$a,d0
  blt lta1
  add.b #'A'-'0'-$a,d0
lta1:
  add.b #'0',d0
  lsr #4,d1
  and.b #$f,d1
  cmp.b #$a,d1
  blt lta2
  add.b #'A'-'0'-$a,d1
lta2:
  add.b #'0',d1
  rts

STR     DC.B $0A,$0D
ADR     DC.B '00000000 ',0

JOY:            ;       ***** JOYSTICK HANDLER *****
WAITXMT:
        MOVE.B  #$16,D0
        JSR     XMT
WAITACIA1:
        JSR     RCV
        MOVE.B  D0,JOY0-1
        CMP.B   #$FD,D0
        BNE     WAITACIA1
WAITACIA2:
        JSR     RCV
        MOVE.B  D0,JOY0
WAITACIA3:
        JSR     RCV
        MOVE.B  D0,JOY1
ENDJOY:
        RTS

XMT:
        BTST    #1,ACIACTL      ; READY TO XMT?
        BEQ     XMT
        MOVE.B  D0,ACIADAT    ; REQUEST JOY PKG
        RTS
RCV:
        BTST    #0,ACIACTL      ; CHAR READY?
        BEQ     RCV
        MOVE.B  ACIADAT,D0      ; NEXT JOY 0
        RTS
       END
 
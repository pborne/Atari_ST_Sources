
SHOTPARM:
        DC.W    0        ;XCORD
        DC.W    0        ;YCORD
        DC.W    1        ;WIDTH
        DC.W    2        ;SPRITE LENGTH (LINES -1)
        DC.W    24       ;SIZE OF SPRITE (BYTES)
        DC.B    0        ;CURRENT SPRITE ANIMATION SEQUENCE #
 DC.B 1        ;TOTAL ANIMATIONS
        DC.L    SHOTDAT  ;SPRITE DATA BASE ADR

        DC.W    0        ;XCORD
        DC.W    0        ;YCORD
        DC.W    1        ;WIDTH
        DC.W    2        ;SPRITE LENGTH (LINES -1)
        DC.W    24       ;SIZE OF SPRITE (BYTES)
        DC.B    0        ;CURRENT SPRITE ANIMATION SEQUENCE #
 DC.B 1        ;TOTAL ANIMATIONS
        DC.L    SHOTDAT  ;SPRITE DATA BASE ADR

        DC.W    0        ;XCORD
        DC.W    0        ;YCORD
        DC.W    1        ;WIDTH
        DC.W    2        ;SPRITE LENGTH (LINES -1)
        DC.W    24       ;SIZE OF SPRITE (BYTES)
        DC.B    0        ;CURRENT SPRITE ANIMATION SEQUENCE #
 DC.B 1        ;TOTAL ANIMATIONS
        DC.L    SHOTDAT  ;SPRITE DATA BASE ADR

        DC.W    0        ;XCORD
        DC.W    0        ;YCORD
        DC.W    1        ;WIDTH
        DC.W    2        ;SPRITE LENGTH (LINES -1)
        DC.W    24       ;SIZE OF SPRITE (BYTES)
        DC.B    0        ;CURRENT SPRITE ANIMATION SEQUENCE #
 DC.B 1        ;TOTAL ANIMATIONS
        DC.L    SHOTDAT  ;SPRITE DATA BASE ADR

;  SHIP SHOT VARIABLES

SHOTNUM:
    DC.W      0
SHOTX:
    DC.W      0,0,0,0
    DC.W      0,0,0,0
SHOTTBL:
    DC.W      $0000,$0004,$0004,$0008,$0008,$0008,$0004,$0004 ;X
    DC.W      $0000,$FFFC,$FFFC,$FFF8,$FFF8,$FFF8,$FFFC,$FFFC
    DC.W      $FFF8,$FFF8,$FFFC,$FFFC,$0000,$0004,$0004,$0008 ;Y
    DC.W      $0008,$0008,$0004,$0004,$0000,$FFFC,$FFFC,$FFF8

; SHIP SHOT ACTIVE FLAGS (4) SHOTS

SHOTFLG1: 
    DC.B      0
SHOTFLG2:
    DC.B      0
SHOTFLG3:
    DC.B      0
SHOTFLG4:
    DC.B      0
 
        BSS
        DS.W    100
STACK:
        DATA
SONG    IBYTES  'D:\ASSEMPRO\WWM\MUSIC\PREHSTRC.SNG'

;FILE    DC.B    'D:\ASSEMPRO\AUDIO.88\PLYSUB.PRG'
;NUL     DC.B    0

FILE    DC.B    'A:PLYSUB.PRG'
NUL     DC.B    0

        TEXT
; ********************************************************************
;              SYSTEM INITIALIZATION   (EXECUTED ONCE)
; ********************************************************************
;                       ***** INITIALIZATION *****
        MOVE.L  4(SP),A0        ; SIZE UP TPA
        MOVE.L  $C(A0),D0       ; PRG LEN
        ADD.L   $14(A0),D0      ; DATA LEN
        ADD.L   $1C(A0),D0      ; BSS LEN
        ADD.L   #$100,D0        ; BASEPAGE LEN
        LEA     STACK,SP        ; LOAD OUR OWN STACK
        MOVE.L  D0,-(SP)        ; LEN
        MOVE.L  A0,-(SP)        ; BASEPAGE
        CLR     -(SP)
        MOVE    #$4A,-(SP)
        TRAP    #1
        ADD.L   #12,SP

        CLR.L   -(SP)           ; SUPER
        MOVE    #$20,-(SP)
        TRAP    #1
        ADDQ.L  #6,SP
        MOVE.L  D0,-(SP)

        PEA     NUL     ; PEXEC
        PEA     NUL
        PEA     FILE
        CLR     -(SP)   ; LOAD AND START
        MOVE    #$4B,-(SP)
        TRAP    #1
        ADD.L   #16,SP

        BRA     NOLMC
MICRODATA =     $FF8922 ; MICROWIRE? INTERFACE DATA REG
MICROMASK =     $FF8924 ; MICROWIRE? INTERFACE MASK REG

        MOVE    #%11111111111,MICROMASK ; 2 BITS ADRESS 9 BITS DATA
        MOVE    #%10011101000,MICRODATA ; -0DB VOLUME
MICROWIREWAIT:
        CMP     #%11111111111,MICROMASK ; WAIT FOR TRANSMITION
        BNE     MICROWIREWAIT
        MOVE    #%10000000001,MICRODATA ; MIX GI WITH SAMPLES
NOLMC:

        MOVE    #0,-(SP)        ;TIMEINIT
        TRAP    #7
        ADDQ.L  #2,SP

        PEA     NUL
        PEA     SONG+10
        MOVE    #2,-(SP)        ;PLAYER TIMEINIT ON
        TRAP    #7
        ADD.L   #10,SP

        MOVE    #7,-(SP)        ; CONIN
        TRAP    #1
        ADDQ.L  #2,SP

        PEA     NUL
        PEA     NUL
        MOVE    #2,-(SP)        ;PLAYER TIMEINIT  OFF
        TRAP    #7
        ADD.L   #10,SP

        MOVE    #1,-(SP)        ;TIMEOFF
        TRAP    #7
        ADDQ.L  #2,SP

        MOVE    #$20,-(SP)      ; BACK TO USER
        TRAP    #1
        ADDQ.L  #6,SP

        CLR     -(SP)           ; TERM
        TRAP    #1


        END
 
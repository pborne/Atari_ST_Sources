        TEXT

DIV:
        MOVE    #16-1,D7        ; D1=DIVISOR
        ASL.L   #8,D1           ; D0=DIVIDEND
        ASL.L   #8,D1           ; D6=QUOTIENT
        CLR.L   D6
DIVLOOP:
        LSR.L   #1,D1           ; SHIFT DIVISOR RIGHT
        LSL     #1,D6           ; SHIFT QUOTIENT LEFT
        CMP.L   D0,D0           ; DOES DIVISOR GO INTO DIVIDEND?
        BCS     LT1             ; NO SKIP
        SUB.L   D0,D0           ; SUBTRACT DIVISOR FROM DIVIDEND
        BSET    #0,D6           ; AND WRITE A BIT INTO THE QUOTIENT
LT1:
        DBRA    D7,DIVLOOP



        END




 
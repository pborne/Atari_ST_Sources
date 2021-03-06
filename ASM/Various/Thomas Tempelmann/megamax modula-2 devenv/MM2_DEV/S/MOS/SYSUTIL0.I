IMPLEMENTATION MODULE SysUtil0;
(*$C+,L-,N+*)

(*$Y+*)
FROM SYSTEM IMPORT ASSEMBLER;

FROM SYSTEM IMPORT BYTE, WORD, LONGWORD, ADDRESS;

FROM MOSGlobals IMPORT Overflow;

PROCEDURE ClearVar ( VAR data: ARRAY OF BYTE );
  BEGIN
    ASSEMBLER
        MOVE.W  -(A3),D0
        MOVE.L  -(A3),A0
     L: CLR.B   (A0)+
        DBRA    D0,L
    END
  END ClearVar;

PROCEDURE VarCleared ( REF data: ARRAY OF BYTE ): BOOLEAN;
  BEGIN
    ASSEMBLER
        MOVE.W  -(A3),D0
        MOVE.L  -(A3),A0
     L: TST.B   (A0)+
        DBNE    D0,L
        SEQ     D0
        ANDI    #1,D0
        MOVE    D0,(A3)+
    END
  END VarCleared;

PROCEDURE VarEqual ( REF data1, data2: ARRAY OF BYTE ): BOOLEAN;
  BEGIN
    ASSEMBLER
        MOVE.W  -(A3),D0
        MOVE.L  -(A3),A0
        MOVE.W  -(A3),D1
        MOVE.L  -(A3),A1
        CMP.W   D0,D1
        BNE     E
     L: CMPM.B  (A0)+,(A1)+
        DBNE    D0,L
        SEQ     D0
        ANDI    #1,D0
        MOVE    D0,(A3)+
        RTS
     E: CLR     (A3)+
    END
  END VarEqual;

PROCEDURE SwapVar ( VAR data1, data2: ARRAY OF BYTE );
  BEGIN
    ASSEMBLER
        MOVE.W  -(A3),D0
        MOVE.L  -(A3),A0
        MOVE.W  -(A3),D1
        MOVE.L  -(A3),A1
        CMP.W   D0,D1
        BEQ     L
        TRAP    #6
        DC.W    Overflow
        RTS
     L: MOVE.B  (A0),D1
        MOVE.B  (A1),(A0)+
        MOVE.B  D1,(A1)+
        DBRA    D0,L
    END
  END SwapVar;

PROCEDURE CopyVar ( REF data1: ARRAY OF BYTE; VAR data2: ARRAY OF BYTE; VAR ok: BOOLEAN );
  BEGIN
    ASSEMBLER
        MOVE.L  -(A3),A2
        MOVE.W  -(A3),D1
        MOVE.L  -(A3),A1        ; DEST
        MOVE.W  -(A3),D0
        MOVE.L  -(A3),A0        ; SOURCE
        MOVE.W  #1,(A2)
        CMP.W   D0,D1
        BEQ     L
        BHI     C
        MOVE    D1,D0
     C: CLR.W   (A2)
     L: MOVE.B  (A0)+,(A1)+
        DBRA    D0,L
    END
  END CopyVar;

PROCEDURE Peek ( addr: ADDRESS ): CARDINAL;
  BEGIN
    ASSEMBLER
        MOVE.L  -(A3),A0
        CLR     D0
        MOVE.B  (A0),D0
        MOVE    D0,(A3)+
    END
  END Peek;

PROCEDURE Poke ( addr: ADDRESS; value: WORD );
  BEGIN
    ASSEMBLER
        MOVE.W  -(A3),D0
        MOVE.L  -(A3),A0
        MOVE.B  D0,(A0)
    END
  END Poke;


PROCEDURE Byte ( value: WORD ): BYTE;
  BEGIN
    ASSEMBLER
        MOVE.B  -1(A3),-2(A3)
    END
  END Byte;

PROCEDURE Cardinal ( value: BYTE ): CARDINAL;
  BEGIN
    ASSEMBLER
        SUBQ.L  #1,A3
        CLR     D0
        MOVE.B  -(A3),D0
        MOVE    D0,(A3)+
    END
  END Cardinal;

PROCEDURE InByte ( bitNo: CARDINAL; value: BYTE ): BOOLEAN;
  BEGIN
    ASSEMBLER
        MOVEQ   #0,D2
        SUBQ.L  #1,A3
        MOVE.B  -(A3),D0
        MOVE.W  -(A3),D1
        CMPI    #7,D1
        BHI     err
        BTST    D1,D0
        SNE     D2
        ANDI    #1,D2
      err:
        MOVE    D2,(A3)+
    END
  END InByte;

PROCEDURE InWord ( bitNo: CARDINAL; value: WORD ): BOOLEAN;
  BEGIN
    ASSEMBLER
        MOVEQ   #0,D2
        MOVE.W  -(A3),D0
        MOVE.W  -(A3),D1
        CMPI    #15,D1
        BHI     err
        BTST    D1,D0
        SNE     D2
        ANDI    #1,D2
      err:
        MOVE    D2,(A3)+
    END
  END InWord;

PROCEDURE InLong ( bitNo: CARDINAL; value: LONGWORD ): BOOLEAN;
  BEGIN
    ASSEMBLER
        MOVEQ   #0,D2
        MOVE.L  -(A3),D0
        MOVE.W  -(A3),D1
        CMPI    #31,D1
        BHI     err
        BTST    D1,D0
        SNE     D2
        ANDI    #1,D2
      err:
        MOVE    D2,(A3)+
    END
  END InLong;

PROCEDURE BIncl ( VAR value: BYTE; bitNo: CARDINAL );
  BEGIN
    ASSEMBLER
        MOVE.W  -(A3),D1
        MOVE.L  -(A3),A0
        CMPI    #7,D1
        BHI     err
        BSET    D1,(A0)
      err:
    END
  END BIncl;

PROCEDURE WIncl ( VAR value: WORD; bitNo: CARDINAL );
  BEGIN
    ASSEMBLER
        MOVE.W  -(A3),D1
        MOVE.L  -(A3),A0
        CMPI    #15,D1
        BHI     err
        MOVE.W  (A0),D0
        BSET    D1,D0
        MOVE.W  D0,(A0)
      err:
    END
  END WIncl;

PROCEDURE LIncl ( VAR value: LONGWORD; bitNo: CARDINAL );
  BEGIN
    ASSEMBLER
        MOVE.W  -(A3),D1
        MOVE.L  -(A3),A0
        CMPI    #31,D1
        BHI     err
        MOVE.L  (A0),D0
        BSET    D1,D0
        MOVE.L  D0,(A0)
      err:
    END
  END LIncl;

PROCEDURE BExcl ( VAR value: BYTE; bitNo: CARDINAL );
  BEGIN
    ASSEMBLER
        MOVE.W  -(A3),D1
        MOVE.L  -(A3),A0
        CMPI    #7,D1
        BHI     err
        BCLR    D1,(A0)
      err:
    END
  END BExcl;

PROCEDURE WExcl ( VAR value: WORD; bitNo: CARDINAL );
  BEGIN
    ASSEMBLER
        MOVE.W  -(A3),D1
        MOVE.L  -(A3),A0
        CMPI    #15,D1
        BHI     err
        MOVE.W  (A0),D0
        BCLR    D1,D0
        MOVE.W  D0,(A0)
      err:
    END
  END WExcl;

PROCEDURE LExcl ( VAR value: LONGWORD; bitNo: CARDINAL );
  BEGIN
    ASSEMBLER
        MOVE.W  -(A3),D1
        MOVE.L  -(A3),A0
        CMPI    #31,D1
        BHI     err
        MOVE.L  (A0),D0
        BCLR    D1,D0
        MOVE.L  D0,(A0)
      err:
    END
  END LExcl;

END SysUtil0.
 
(* $FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$00000BEE$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82$FFFA3C82�$00000291T.......T.......T.......T.......T.......T.......T.......T.......T.......T.......$0000046A$0000048F$000004F7$00000559$0000050F$00000552$000000B3$0000053D$000000A0$000005EC$0000005A$00000195$000002AB$00000291$FFFC8722$0000094F���*)

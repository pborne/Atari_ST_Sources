; initialisation SETBLOCK gemdos

SETBLOCK  MACRO
          move.l    a7,a5
          lea       pile,a7
          move.l    4(a5),a5     
          move.l    $c(a5),d0    
          add.l     $14(a5),d0
          add.l     $1c(a5),d0
          add.l     #$100,d0
          move.l    d0,-(sp)
          move.l    a5,-(sp)
          move      #0,-(sp)
          move      #$4a,-(sp)
          trap      #1
          adda.l    #12,sp
          ENDM
          END
 
 ; Vt100 Bios - Systemeinbindung
          dc.l    'XBRA',XB_ID,0
NEW_Bios:
          MOVE.L  $4a2,A1           ;DATENSICHERUNGSBEREICH
          move    (sp)+,d0          ;SR holen
          move    d0,-(a1)          ;und retten
          move.l  (sp)+,-(a1);      ;PC holen und retten
          movem.l d3-d7/a3-a7,-(a1) ;und Register retten
          move.l  a1,$4a2           ;Zeiger retten
          btst    #13,d0            ;Aufruf im Supervisor-Modus?
          bne.s   \super            ;wenn so
          move.l  usp,sp            ;benutze USP
\super    move    (sp)+,d0          ;hole Funktionsnummer
          cmp     #1,d0             ; INP?
          beq.s   bconstat
          cmp     #2,d0             ; INP
          beq.s   bconin
          cmp     #3,d0             ; OUT
          beq.s   bconout
          cmp     #8,d0             ; OUT?
          beq.s   bcostat
go_old_bios move    d0,-(sp)
          move.l  $4a2,a1           ;auf Sicherungsbereich
          movem.l (a1)+,d3-d7/a3-a7 ;Register zurueck
          move.l  (a1)+,-(sp)       ;PC wieder auf Stack
          move    (a1)+,-(sp)       ;SR dto.
          move.l  a1,$4a2           ;Zeiger zurueck
          dc.w    $4ef9           ; JMP
OLD_BIOS: dc.l  $DEADFACE

bconstat: move  (sp),d1
          cmp   #4,d1               ; INP?(4)
          bne.s \nn2
          bsr   INPs4
          bra.s exit
\nn2      cmp   #5,d1               ; INP?(5)
          bne.s  go_old_bios
          bsr    INPS5
          bra.s  exit
bconin:   move   (sp),d1
          cmp    #4,d1              ; INP(4)
          bne.s  \nn1
          bsr    INP4
          bra.s  exit
\nn1      cmp    #5,d1              ; INP(5)
          bne.s  go_old_bios
          bsr    INP5
          bra.s  exit
bconout:move    (sp),d1
        cmp     #2,d1             ; OUT 2
        bne.s   \nn1
        tst     (sp)+
        BSR     VT100
        bra.s   exit
\nn1    cmp     #5,d1             ; OUT 5
        bne.s   go_old_bios
        tst     (sp)+
        lea     esc_vars(pc),a6
        bsr     hide_cursor
        move    (sp),d7
        and.l   #$ff,d7
        bsr     OUT5
        BSR     SHOW_CURSOR
        bra.s   exit
bcostat:move    (sp),d1
        cmp     #2,d1           ; OUT?(2)
        bne.s   \hupf
        moveq   #-1,d0
        bra.s   exit
\hupf   cmp     #5,d1           ; OUT?(5)
        bne     go_old_bios
        moveq   #-1,d0
exit    move.l  $4a2.s,a1           ;auf Sicherungsbereich
        movem.l (a1)+,d3-d7/a3-a7 ;Register zurueck
        move.l  (a1)+,-(sp)       ;PC wieder auf Stack
        move    (a1)+,-(sp)       ;SR dto.
        move.l  a1,$4a2.s         ;Zeiger zurueck
        rte

        end

 
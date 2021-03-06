;
; D�tecteur de virus (d�tecte un secteur boot ex�cutable)
; Assembleur                   VIRUS.ASM
;

gemdos         = 1
xbios          = 14

crawcin        = 7
cconws         = 9
floprd         = 8
flopwr         = 9

               .TEXT 

               lea.l      text1,a0      ;Message: Ins�rez une disquette SVP
               bsr        print
               bsr        taste

; Lire piste 0 secteur 1

               move.w     #1,-(sp)      ;lire un secteur
               clr.w      -(sp)         ;Face 0
               clr.w      -(sp)         ;Piste 0
               move.w     #1,-(sp)      ;Secteur 1
               clr.w      -(sp)         ;Lecteur A:
               clr.l      -(sp)         ;Filler, sans signification
               pea        tampon        ;Stocker ici
               move.w     #floprd,-(sp) ;Num�ro de fonction
               trap       #xbios
               adda.l     #20,sp

               tst.w      d0            ;Erreur?
               bmi        readerr

; Calcule la somme de contr�le

               clr.w      d0
               lea.l      tampon,a0
               move.w     #255,d1       ;Ajoute 256 mots
loop:          add.w      (a0)+,d0
               dbra       d1,loop

               cmpi.w     #$1234,d0     ;Ex�cutable?
               bne.s      not_ex

               lea.l      demande,a0    ;Si oui, demander s'il doit devenir
               bsr        print         ;non ex�cutable
inloop:        bsr.s      taste
               cmpi.b     #'n',d0       ;n appuy�?
               beq.s      fin
               cmpi.b     #'o',d0       ;ou o?
               bne.s      inloop        ;Ni l'un ni l'autre, alors normal

               lea.l      ok,a0
               bsr.s      print

               addi.b     #1,tampon+511 ;Modifier le dernier octet

; Recopier le secteur

               move.w     #1,-(sp)      ;�crire un secteur
               clr.w      -(sp)         ;Face 0
               clr.w      -(sp)         ;Piste 0
               move.w     #1,-(sp)      ;Secteur 1
               clr.w      -(sp)         ;Lecteur A:
               clr.l      -(sp)         ;Filler, sans signification
               pea        tampon        ;le voil� dans la m�moire
               move.w     #flopwr,-(sp) ;Num�ro de fonction
               trap       #xbios
               adda.l     #20,sp

               cmpi.w     #-13,d0       ;Disquette prot�g�e contre �criture?
               beq.s      schutz

               tst.w      d0            ;autre erreur?
               bpl.s      fin           ;si non, fin

               lea.l      disktxt,a0
               bra.s      errcont

schutz:        lea.l      sch_txt,a0
               bra.s      errcont

not_ex:        lea.l      text2,a0
               bra.s      errcont

readerr:       lea.l      retext,a0
errcont:       bsr        print

fin:           lea.l      endtext,a0
               bsr.s      print
               bsr        taste

               clr.w      -(sp)         ;Fin du programme
               trap       #gemdos

taste:         move.w     #crawcin,-(sp)          ;Attendre appui touche
               trap       #gemdos
               addq.l     #2,sp
               rts        


print:         pea        (a0)          ;Afficher le texte sur lequel
               move.w     #cconws,-(sp) ;a0 pointe
               trap       #gemdos
               addq.l     #6,sp
               rts        

               .DATA 

text1:         .DC.b 'Ins�rez une disquette dans le lecteur A: SVP!'
               .DC.b 13,10,0

text2:         .DC.b "Le secteur boot n'est pas ex�cutable!",13,10,0

demande:       .DC.b 'Le secteur boot est ex�cutable.',13,10
               .DC.b 'Dois-je le modifier?',0

ok:            .DC.b 'Oui',13,10,0

disktxt:       .DC.b 'Erreur disquette',13,10,0

sch_txt:       .DC.b "La disquette �tait prot�g�e contre l'�criture!",13,10,0

retext:        .DC.b 'Disquette endommag�e!',13,10,0

endtext:       .DC.b 13,10,10,'Touche = Fin...',0

               .BSS 

tampon:        .DS.b 512

               .END 

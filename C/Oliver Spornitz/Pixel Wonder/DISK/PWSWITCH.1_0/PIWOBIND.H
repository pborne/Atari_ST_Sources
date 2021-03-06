/*
 *	Deklarationen f�r PIWOBIND.S
 *	Copyright 1991: Oliver Spornitz und Detlev Nolte
 */
 
#if !defined( __PIWOBIND__ )
#define __PIWOBIND__


/* Konstanten f�r Aufl�sung umschalten im Pexec-Modus */
#define DIRECTLY	0
#define LATER		1
#define POFF		2

/*
 *	Grafikparameterblock f�r PIWO
 */
typedef struct
{
	int		xtotal;
	int		ytotal;
	int 	xdisplayed;
	int		ydisplayed;
	int 	HSpos;
	int 	VSpos;
	int		HSwidth;
	int 	ausgleich;
	int		planes;
	int		interlace;
	char	Gname[16];
}GPB;

/*
 * Funktionsdeklarationen f�r PIWOBIND.S
 */
long cdecl getres( GPB *resbuffer );			/* ret: <0=fail, sonst Gr��e Bildschirmspeicher 	*/
long cdecl setres( GPB *resbuffer, int mode);	/* ret: 0 = erfolgreich, 
													 	>0 = Aufl�sung zu gro�
													 	-1 = Fehler bei der Parameter�bergabe
													 	-2 = Grafiktreiber nicht installiert */
/*
 * Steht in chk_sign.c
 */
long cdecl _checkinstall(void);					/* ret: 0 = Grafiktreiber installiert
														-2 = Grafiktreiber nicht installiert */

#endif

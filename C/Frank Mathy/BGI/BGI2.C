/*	Beispielprogramm 2 								*/
/*	Von Frank Mathy f�r die TOS 10/90					*/
/*	F�r Turbo C 2.0 (mit BGI-Bibliothek				*/

#include <stdio.h>
#include <stdlib.h>
#include <ext.h>
#include <graphics.h>				/* BGI-Bibliothek		*/

#define XRAND rand()%maxx			/* Zuf�llige Koordinaten	*/
#define YRAND rand()%maxy
#define RRAND rand()%100
#define WRAND rand()%360				/* Zuf�llige Winkel		*/

int treiber=DETECT;					/* Treibertyp			*/
int modus;						/* Grafikmodus			*/
int maxx,maxy;						/* Maximale Koordinaten	*/
int maxc;							/* Gr��te Zeichenfarbe	*/

void init_all(void)					/* Initialisierungen	*/
	{
	initgraph(&treiber,&modus,"");	/* BGI initialisieren	*/
	graphdefaults();				/* Normaleinstellungen	*/
	maxx=getmaxx();				/* Maximale X-Koordinate	*/
	maxy=getmaxy();				/* Maximale Y-Koordinate	*/
	maxc=getmaxcolor();				/* Maximale Farbe		*/
	cleardevice();					/* Bildschirm l�schen	*/
	}

void exit_all(void)					/* Beenden des Programmes*/
	{
	setallpalette(getdefaultpalette());/* Alte Farbpalette		*/
	closegraph();					/* BGI-Arbeiten beenden	*/
	}

void main(void)
	{
	int e[8];
	srand(0);						/* Zufallsgenerator an	*/
	init_all();					/* Alles initialisieren	*/
	setpalette(0,WHITE);			/* Wei�er Hintergrund	*/
	
	e[0]=e[6]=10;	e[1]=e[7]=10;		/* Punkt 1			*/
	e[2]=maxx-20; 	e[3]=maxy/2;		/* Punkt 2			*/
	e[4]=maxx/2;	e[5]=maxy-10;		/* Punkt 3			*/
	drawpoly(4,e);					/* Dreieck zeichnen		*/
	
	setwritemode(XOR_PUT);			/* Exclusiv-Oder		*/
	while(!kbhit())				/* Solange keine Taste	*/
		{
		setcolor(rand()%maxc);		/* Zuf�llige Farbe		*/
		setlinestyle(rand()%5,rand(),NORM_WIDTH);
		
		switch(rand()%6)			/* Zuf�llige Operation	*/
			{
			case 0:	line(XRAND,YRAND,XRAND,YRAND);
					break;		/* Zuf�llige Gerade		*/
			case 1:	rectangle(XRAND,YRAND,XRAND,YRAND);
					break;		/* Zuf�lliger Rahmen	*/
			case 2:	circle(XRAND,YRAND,RRAND);
					break;		/* Zuf�lliger Kreis		*/
			case 3:	arc(XRAND,YRAND,WRAND,WRAND,RRAND);
					break;
			case 4:	ellipse(XRAND,YRAND,WRAND,WRAND,RRAND,RRAND);
					break;		/* Zuf�llige Ellipse	*/
			case 5:	cleardevice();
					break;
			}
		}


	exit_all();					/* Arbeit beenden		*/
	}

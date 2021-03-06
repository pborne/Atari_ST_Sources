/*
   Modul: M_RANDOM (Headerdatei)

   geschrieben von Thomas K�nneth
   Friedrich-Neuper-Str. 2b
   90552 R�thenbach

   Diese Datei ist Bestandteil der C-Version von Magic 4.0 von
   Peter Hellinger und Thomas K�nneth und darf nur gem�� den
   Nutzungsbedingungen von Magic f�r C verwendet werden

   Alle Rechte beim Autor
*/

#ifndef _MPRANDOM_
#define _MPRANDOM_

#ifndef _MAGICTYP_
#include <magic\m_types.h>
#endif

void  RandomInit(int initial);
int   RndInt(int max);
long  RndLInt(long max);
float RndReal(void);

#define  Randomize()    CallMagic(1800)

#endif
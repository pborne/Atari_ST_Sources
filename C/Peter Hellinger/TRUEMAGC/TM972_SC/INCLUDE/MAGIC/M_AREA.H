/*
   Modul: M_AREA (Headerdatei)

   geschrieben von Thomas K�nneth
   Friedrich-Neuper-Str. 2b
   90552 R�thenbach

   Diese Datei ist Bestandteil der C-Version von Magic 4.0 von
   Peter Hellinger und Thomas K�nneth und darf nur gem�� den
   Nutzungsbedingungen von Magic f�r C verwendet werden

   Alle Rechte beim Autor
*/

#ifndef _MPAREA_
#define _MPAREA_

#ifndef _MAGICTYP_
#include <magic\m_types.h>
#endif

typedef struct
{
   int      x,
            y,
            w,
            h;
   BOOLEAN  init;
   long     size;
   void     *mfdbadr;
   MFDB     mfdb;
} AreaDescr;

typedef AreaDescr* AREA;

BOOLEAN NewAREA(AREA *a);
void DisposeAREA(AREA *a);
void FreeArea(AREA *a);
BOOLEAN SaveArea(int hndl,AREA *a,GRECT *rect);
void RestoreArea(int hndl,AREA *a);
void CopyArea(int hndl,AREA *a,int xx,int yy);
void MoveArea(int hndl,AREA *a,int xmove,int ymove,int *xx,int *yy);
void SetMFDB(MFDB *m,void *adr,int w,int h,int fm,int planes);

#endif
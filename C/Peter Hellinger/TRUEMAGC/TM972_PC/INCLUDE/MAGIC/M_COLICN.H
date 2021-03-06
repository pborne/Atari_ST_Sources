/*
   Farb-Icons (M_COLICN.H)

   geschrieben von Thomas K�nneth
   Friedrich-Neuper-Str. 2b
   90552 R�thenbach

   Diese Datei ist Bestandteil der C-Version von Magic 4.0 von
   Peter Hellinger und Thomas K�nneth und darf nur gem�� den
   Nutzungsbedingungen von Magic f�r C verwendet werden

   Alle Rechte beim Autor
*/

#ifndef _MPCOLICN_
#define _MPCOLICN_

/* f�r Farbicons wichtige Strukturen */
typedef struct cicon_data {
   int   num_planes;   /* number of planes in the following data */
   int   *col_data;    /* pointer to color bitmap in standard form */
   int   *col_mask;    /* pointer to single plane mask of col_data */
   int   *sel_data;    /* pointer to color bitmap of selected icon */
   int   *sel_mask;    /* pointer to single plane mask of selected icon */
   struct cicon_data *next_res;  /* pointer to next icon for a different resolution */
} CICON;

typedef struct cicon_blk {
   ICONBLK monoblk;    /* default monochrome icon */
   CICON   *mainlist;  /* list of color icons for different resolutions */
} CICONBLK;

#endif
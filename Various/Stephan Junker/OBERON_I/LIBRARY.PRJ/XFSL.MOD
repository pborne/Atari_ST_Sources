MODULE XFSL; (* SJ 26.2.95 *)


(*
 Support of XFSL, a more sophisticated font selector.
 *)


IMPORT
  S:=SYSTEM, Evnt, Cookie;


CONST
  (* Die R�ckgabewerte (von xfsl_init, xfsl_event und xfsl_input) *)
  LOADERROR* = -8;  (* Fehler beim Nachladen des xFSL-Moduls *)
  RESERROR*  = -7;  (* Aufl�sung zu klein (mind. 640x400 Punkte) *)
  NOHANDLE*  = -6;  (* Kein Handle frei *)
  NOWINDOW*  = -5;  (* Kein Fenster frei *)
  NOFONTS*   = -4;  (* Keine Fonts geladen *)
  NOFONTSIZE*= -3;  (* Fontgr��e nicht identifizierbar *)
  ACTIVE*    = -2;  (* Fontselektor ist bereits aktiv *)
  ERROR*     = -1;  (* allgemeiner Fehler (Speichermangel o.�.) *)
  STOP*      =  0;  (* <Abbruch> gew�hlt *)
  OK*        =  1;  (* <Ok> gew�hlt *)
  HELP*      =  2;  (* Hilfe-Button angew�hlt *)
  EVENT*     =  3;  (* AES-Event aufgetreten *)
  POPUPCHANGE*= 4; (* �nderung am User-Popup *)

  (* font flags (bit numbers) *)
  SYSTEM*       = 0;  (* der Systemfont soll auf jeden Fall angezeigt werden *)
  MONOSPACED*   = 1;  (* monospaced Fonts anzeigen *)
  PROPORTIONAL* = 2;  (* proportionale Fonts anzeigen *)
  VEKTOR*       = 3;  (* Vektorfonts anzeigen *)
  BITMAP*       = 4;  (* Bitmapfonts anzeigen *)
  ALL*          = {1,2,3,4}; (* alle Fonts anzeigen *)
  CHANGED*      = 15; (* Flag f�r �nderungen (beim Popup, dazu sp�ter) *)

  (* info bits *)
  SIZECHANGE*   = 0;  (* Gr��en�nderung m�glich *)
  COLOR*        = 1;  (* Farb�nderung m�glich *)
  ATTR*         = 2;  (* Attribut�nderung m�glich *)
  WIDTH*        = 3;  (* Breiten�nderung m�glich *)
  KERN*         = 4;  (* Kerning�nderung m�glich *)
  SKEW*         = 5;  (* Neigungs�nderung m�glich *)
  FIX31*        = 8;  (* fix31-Unterst�tzung *)
  POPUP*        = 9;  (* Popup-Unterst�tzung *)
  DRAGDROP*     = 10; (* Drag&Drop-Unterst�tzung *)
  INFOERROR*    = 31; (* negativ = Fehler *)

  (* not used *)
  BITMAPFONT* = 0001H;
  SPEEDOFONT* = 0002H;
  TTFONT*     = 0004H;  (* TrueType *)
  PFBFONT*    = 0008H;  (* Type1 *)
  CFNFONT*    = 0010H;  (* Calamus, noch nicht implementiert *)



TYPE
  EventDesc* = RECORD
    (* input parameters *)
    evMflags*, evMbclicks*, evBmask*, evMbstate*, evMm1flags*,
    evMm1x*, evMm1y*, evMm1width*, evMm1height*, evMm2flags*,
    evMm2x*, evMm2y*, evMm2width*, evMm2height*, evMtlocount*,
    evMthicount*: INTEGER;
    (* output parameters *)
    evMwich*, evMmox*, evMmoy*, evMmobutton*, evMmokstate*,
    evMkreturn*, evMbreturn* : INTEGER;
    (* message buffer *)
    evMmgpbuf*: Evnt.msgbuf;
  END;

  StringPtr* = POINTER TO ARRAY OF CHAR;

  Fix31* = LONGINT;

  FSize* = RECORD
    size*: INTEGER;         (* Fontgr��e in Punkt         *)
    size31*: Fix31;         (* Fontgr��e in 1/65536 Punkt *)
  END;

  FWInfo* = INTEGER;

  PFontInfo* = RECORD
    fontid*: INTEGER;       (* ID des Fonts                      *)
    fonttype*: INTEGER;     (* Typ des Fonts, siehe vqt_info()   *)
    fontname*: StringPtr;   (* Name des Fonts, siehe vqt_name()  *)
    fontsize*: FSize;       (* Fontgr��e, s.o.                   *)
    fontwidth*: FWInfo;     (* Breite und Kerning                *)
    fontattr*: INTEGER;     (* Attribute                         *)
    fontcol*: INTEGER;      (* Farbe                             *)
    fontskew*: INTEGER;     (* Neigung                           *)
  END;

  PEntryPtr* = POINTER TO RECORD
    entry*: StringPtr;        (* Text des Popup-Eintrags             *)
    fontinfo*: PFontInfo;     (* Fontinfo-Struktur                   *)
    fontflags*: INTEGER;      (* erlaubte Fontarten                  *)
    funcflags*: LONGINT;      (* Funktionsflags, nur f�r xUFSL       *)
  END;

  Par* = RECORD
    size*: LONGINT;         (* Gr��e der Struktur                       *)
    control*: LONGINT;      (* Kontroll-Flags, s.u.                     *)
    headline*: StringPtr;   (* �berschrift oder NIL                     *)
    example*: StringPtr;    (* Beispieltext oder NIL                    *)
    helptext*: StringPtr;   (* Text f�r den Hilfe-Button oder NIL       *)
    font*: PFontInfo;       (* Fontinfo, s.o.                           *)
    fontflags*: INTEGER;    (* erlaubte Fontarten                       *)
    poptext*: StringPtr;    (* Text vor dem Popup (nur Calvino) oder NIL*)
    numEntries*: INTEGER;   (* Anzahl der Eintr�ge (0..n)               *)
    selEntry*: INTEGER;     (* Selektierter Eintrag (0..n-1)            *)
    popup*: PEntryPtr;      (* Zeiger auf ein Popup oder NIL            *)
  END;

  CookiePtr* = POINTER TO RECORD
    xfsl-: LONGINT;       (* Magic 'xFSL'                           *)
    revision-: INTEGER;   (* Revisionsnummer der Schnittstelle      *)
    product-: LONGINT;    (* Kennung des Fontselektors, z.B. 'CLVN' *)
    version-: INTEGER;    (* Version des Fontselektors als BCD      *)
    xfslInput-: PROCEDURE (
                  VAR size: INTEGER;
                  VAR id: INTEGER;
                  headline : StringPtr;
                  fontflags: INTEGER;
                  vdihandle: INTEGER
                 ) : INTEGER;
    xfslInit-: PROCEDURE (
                  VAR par: Par;
                  vdihandle: INTEGER
                ) : INTEGER;
    xfslEvent-: PROCEDURE (
                  VAR event: EventDesc;
                  xhandle: INTEGER
                 ) : INTEGER;
    xfslExit-: PROCEDURE (xhandle: INTEGER);
    xfslInfo-: PROCEDURE () : SET;
  END;



PROCEDURE GetCookie*(VAR cookie: CookiePtr) : BOOLEAN;
(*
 Store the cookie value and return true if found.
 *)
  VAR
    value: LONGINT;
 BEGIN
  IF Cookie.Search("xFSL", value) THEN
    cookie := value;
    RETURN TRUE
  END;
  RETURN FALSE
 END GetCookie;


PROCEDURE Input*(
    vdihandle: INTEGER;
    fontflags: SET;
    headline: ARRAY OF CHAR;
    VAR id, size: INTEGER) : INTEGER;
  VAR
    cookie: CookiePtr;
 BEGIN
  IF GetCookie(cookie) THEN
    RETURN cookie.xfslInput(size, id, S.ADR( headline),
        SHORT( S.VAL( LONGINT, fontflags)), vdihandle);
  END;
  RETURN -100;
 END Input;


PROCEDURE Init*(vdihandle: INTEGER; VAR par: Par) : INTEGER;
  VAR
    cookie: CookiePtr;
 BEGIN
  IF GetCookie(cookie) THEN
    RETURN cookie.xfslInit(par, vdihandle)
  END;
  RETURN -100;
 END Init;


PROCEDURE Event*(xhandle: INTEGER; VAR event: EventDesc) : INTEGER;
  VAR
    cookie: CookiePtr;
 BEGIN
  IF GetCookie(cookie) THEN
    RETURN cookie.xfslEvent(event, xhandle)
  END;
  RETURN -100;
 END Event;


PROCEDURE Exit*(xhandle: INTEGER);
  VAR
    cookie: CookiePtr;
 BEGIN
  IF GetCookie(cookie) THEN
    cookie.xfslExit(xhandle);
  END;
 END Exit;


PROCEDURE Info*(xhandle: INTEGER) : SET;
  VAR
    cookie: CookiePtr;
 BEGIN
  IF GetCookie(cookie) THEN
    RETURN cookie.xfslInfo();
  END;
  RETURN {INFOERROR};
 END Info;


END XFSL.
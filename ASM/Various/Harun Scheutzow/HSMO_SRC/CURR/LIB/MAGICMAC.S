;MgMc-Cookie-Struktur-Offsets
;Dieser Cookie wird von MagiCMac angelegt

MM_vers   = 0       ;.w Versionskennung im BCD-Format ($0214 entspr�che 2.14).
MM_size   = 2       ;.w Gr��e der gesamten Struktur in Bytes.
MM_flags1           = 4              ;.l Screen-Flags (Bit 0: 640*400-Emulation, 1: Rechts-Shift m�glich).
MM_scrnPMPtr        = 8              ;.l Zeiger auf Screen-Beschreibung (s. Inside Macintosh, PixMap)
MM_updatePalette    = 12             ;.l Zeiger auf Boolean, Ist zu setzen, um Farbtabellen zu restaurieren.
MM_modeMac          = 16             ;.l ProcPtr, Umschaltung der MMU auf Mac-Modus. Zerst�rt keine Regs.
MM_modeAtari        = 20             ;.l ProcPtr, Umschaltung der MMU auf Atari-Modus. Zerst�rt keine Regs.
MM_getBaseMode      = 24             ;.l ProcPtr Liefert in D0.W MMU-Modus (0: Mac, sonst Atari). Zerst�rt keine Regs.
MM_getIntrCount     = 28             ;.l ProcPtr Liefert in D0.L Intr-Semaphore-Z�hler (0:frei). Zerst�rt keine Regs.
MM_intrLock         = 32             ;.l ProcPtr Erh�ht Interrupt-Semaphore-Z�hler. Zerst�rt keine Regs.
MM_intrUnlock       = 36             ;.l ProcPtr Erniedrigt Interrupt-Semaphore-Z�hler. Zerst�rt keine Regs.
MM_callMacContext   = 40             ;.l ProcPtr F�hrt Routine im Mac-Kontext aus, Proc-Adr auf Stack. Zerst�rt D0-D2/A0/A1
MM_atariZeroPage    = 44             ;.l Ptr Zeiger auf den Atari-Speicherbereich $0-$800 im Mac-Adre�raum
MM_macA5  = 48      ;.l Wert des A5-Registers im Mac-Kontext
MM_macAppSwitch     = 52             ;.l ProcPtr Aufruf durch MagiC-Kernel (D0/4(A7): 0:Suspend, 1:Resume, 2:Quit)
MM_controlSwitch    = 56             ;.l ProcPtr Aufruf durch MagiC-Kernel (D0/4(A7): Atari-Screen 0:Hide, 1:Show)
MM_hardwareAttr1    = 60             ;.l z.Zt. undefiniert.
MM_hardwareAttr2    = 64             ;.l z.Zt. undefiniert.
MM_magiC_BP         = 68             ;.l Zeiger auf Base Page des MagiC OS.
MM_auxOutName       = 72             ;.l Zeiger auf Pascal-String f�r AUX-Ausgabe-Device
MM_auxInName        = 76             ;.l Zeiger auf Pascal-String f�r AUX-Eingabe-Device
MM_auxControl       = 80             ;.l ProcPtr Aufruf durch MagiC-Kernel (D0/4(A7): 0:Suspend, 1:Resume, 2:Quit)
;(ist 0, wenn keine Routine eingetragen, in sp�teren Versionen zeigt er auf RTS)
;ab hier erst in neueren Versionen (MM_size testen)
MM_PrintDesk        = 84             ;.l Zeiger auf eine Druckerkonfig-Info-Struktur
MM_configKernel     = 88             ;.l Zeiger auf eine Konfig.funktion (200Hz etc)
;14 .l reserviert


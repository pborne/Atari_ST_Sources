DEFINITION MODULE AESForms;


(*  Megamax Modula-2 GEM-Library :  Die AES Formularfunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  05.11.87
 *
 *  Version   2.2     V#0015
 *)
 

(*      Dieses Modul unterst�tzt die Benutzung von Formularen (Dialogboxen).
 *
 *      Die Prozeduren 'FormError' und 'FormAlert' f�hren dabei einen kom-
 *      pletten Dialog und bauen die ben�tigte Objektbaumstruktur selbst-
 *      st�ndig auf.
 *      Die restlichen Routinen �bernehmen jeweils Teilaufgaben beim F�hren
 *      eines Dialogs mit einer vom Benutzer frei definierbaren Dialogbox,
 *      deren Definition in Form eines Objektbaumes (siehe 'GEMGlobals')
 *      vorhanden sein mu�.
 *)
 

FROM GrafBase   IMPORT Rectangle;

FROM GEMGlobals IMPORT GemChar, PtrObjTree;
 
 
                        (*  Form Manager  *)
                        (*  ============  *)

PROCEDURE FormCenter (tree: PtrObjTree): Rectangle;

        (*  Zentriert Dialogbox und liefert den belegten Bildschirmbereich.
         *
         *  Dabei ist 'tree' der Objektbaum, der die Box beschreibt und es
         *  werden die Ausma�e und die neue Position der Dialogbox als Funk-
         *  tionswert geliefert.
         *)


TYPE    FormDialMode    = (reserveForm, growForm, shrinkForm, freeForm);
        
PROCEDURE FormDial (flag: FormDialMode; little, big: Rectangle);

        (*  Bereitet einen Dialog vor und beendet ihn auch wieder.
         *
         *  Eingabeparameter:
         *  -----------------
         *
         *  'flag'      -- Bestimmt die Funktion der Routine (siehe unten).
         *  'big'       -- Gr��e und Position der Dialogbox (z.B. von
         *                 'FormCenter').
         *  'little'    -- Bildschirmbereich in dem das Objekt (Men�punkt,
         *                 Icon, etc.) liegt, das den Dialog ausgel��t hat.
         *                 Wird nur bei 'growForm' und 'shrinkForm' gebrau-
         *                 cht.
         *
         *  Funktionen:
         *  -----------
         *
         *  'reserveForm' -- Reserviert den von der Dialogbox belegten Bild-
         *                   schirmbereich.
         *  'growForm'    -- Zeichnet ein sich ausdehnendes Rechteck.
         *  'shrinkForm'  -- Zeichnet ein schrumpfendes Rechteck.
         *  'freeForm'    -- Gibt den von der Dialogbox belegten Bildschirm-
         *                   bereich wieder frei, dabei wird das Neuzeichnen
         *                   des Bereichs veranla�t.
         *
         *  Die zweite und dritte Funktion ist optional, da� hei�t sie sind
         *  beide sch�n anzusehen, f�r das korrekt Funktionieren des Dialogs
         *  sind sie aber nicht notwendig.
         *
         *  Der vierte Modus ist gut geeignet das Neuzeichnen, bestimmter
         *  Bildschirmausschnitte, zu erzwingen.
         *)
        
PROCEDURE FormDo (tree: PtrObjTree; first: CARDINAL; VAR retBut: CARDINAL);

        (*  F�hrt einen Teildialog durch, da� hei�t alle vom Benutzer inner-
         *  halb der Dialogbox durchgef�hrten Aktionen werden selbst�ndig
         *  ausgewehrtet. Erst beim Selektieren eines Objektes mit gesetztem
         *  'selectExitFlg'-Flag oder Anklicken eines Objektes mit gesetztem
         *  'touchExitFlag' kehrt die Routine zur�ck.
         *
         *  Eingabeparameter:
         *  -----------------
         *
         *  'tree'      -- Objektbaum, der die Dialogbox beschreibt.
         *  'first'     -- Objektindex, der edierbaren Zeichenkette, auf
         *                 der der Cursor zuerst plaziert werden soll.
         *                 'Root' sollte �bergeben werden, falls kein sol-
         *                 ches Feld existiert, oder das erste im Baum be-
         *                 nutzt werden soll.
         *
         *  Ausgabeparameter:
         *  -----------------
         *
         *  'retBut'    -- Index des Objektes, dessen Selektieren oder An-
         *                 klicken den Teildialog abgebrochen hat.
         *
         *    WICHTIG: Wird die Dialogbox mit einem Doppelklick verlassen,
         *             so ist das h�chstwertige Bit von 'retBut' gesetzt,
         *             d.h., der Wert ist um 32768 gr��er und mu� unbedingt
         *             abgezogen werden, wenn der Wert als Index im Baum
         *             weiterbenutzt oder verglichen werden soll!
         *
         *  Voraussetzung f�r das korrekte Funktionieren, dieser Prozedur,
         *  ist, da� sich die von 'tree' beschriebene Dialogbox schon auf
         *  dem Bildschirm befindet.
         *)
         

PROCEDURE FormAlert (    defBut: CARDINAL;
                     REF str   : ARRAY OF CHAR;
                     VAR retBut: CARDINAL);

        (*  F�hrt einen vollst�ndigen Dialog mit dem Benutzer. Der Dialog
         *  ist auf einen maximal 5 zeiligen Text und die Angabe von bis
         *  zu 3 Kn�pfen begrenzt.
         *
         *  Es bestimmt 'defBut' den Standardknopf, d.h. den Knopf, der
         *  selektiert wird, sobald der Benutzer die <Return>-Taste dr�ckt.
         *  Au�erdem bestimmt 'str' den Inhalt der Dialogbox und 'retBut'
         *  liefert den Knopf, dessen Selektion den Dialog beendet hat.
         *
         *  Diese Art von Formularen wird meist f�r Fehler- oder Warnmel-
         *  dungen benutzt, ihr Inhalt wird wie folgt festgelegt.
         *
         *  Aufbau von 'str':
         *  -----------------
         *
         *  Syntax:    '[' <Icon> '][' <Text> '][' <Kn�pfe> ']'
         *
         *  Dabei ist,
         *
         *    <Icon> eine Zahl zwischen 0 und 3
         *
         *              0 -- kein Icon (Piktogramm)
         *              1 -- NOTE-Icon
         *              2 -- WAIT-Icon
         *              3 -- STOP-Icon
         *
         *    <Text> ein String, der in maximal 5 Bl�cke mit 29 Zeichen
         *    aufgeteilt ist. Die Trennung der einzelnen Bl�cke, die von
         *    der Routine in verschiedenen Zeilen ausgegeben werden, fin-
         *    det durch '|' statt;
         *
         *    <Kn�pfe> ist ebenfalls eine Zeichenkette, die durch '|' in
         *    diesmal h�chstens 3 Bl�cke zu je 9 Zeichen geteilt wird.
         *    Jeder Block wird auf dem Bildschirm zu einem Knopf (button).
         *    Die Buttons werden von links nach rechts von 1 bis 3 durch-
         *    nummeriert.
         *
         *  Eine Besonderheit dieses Dialoges ist, da� der Bildschirmhinter-
         *  grund automatisch gerettet und am Dialogende wiederhergestellt
         *  wird.
         *
         *  Beispiel:
         *  ---------
         *
         *    FormAlert(1,'[3][ *** BUS ERROR *** | in Zeile 5!][ Pech ]',but)
         *
         *    Es w�rde das STOP-Icon erscheinen mit dem Text ' *** BUS
         *    ERROR *** ' in der ersten und ' in Zeile 5!' in zweiten
         *    Zeile. Der einzige Knopf w�re gleichzeitig Standardknopf
         *    und bes��e den Text ' Pech '.
         *    'but' mu� eine Variable vom Typ CARDINAL sein.
         *)

PROCEDURE FormError (errNo: INTEGER);

        (*  Gibt eine Systemfehlermeldung mit Hilfe einer Alertbox aus.
         *
         *  'errNo' kann die folg. Werte annehmen:
         *
         *    2, 3, 18: "Diese Anwendung kann Datei oder Ordner nicht finden"
         *    4: "Kein Platz mehr f�r weitere Fenster - Bitte eins schlie�en"
         *    5: "Datei existiert bereits oder ist Schreibgesch�tzt"
         *    8, 10, 11: "Es steht nicht genug Speicher f�r diese Anwendung
         *                zur Verf�gung"
         *    15: "Dieses Laufwerk ist nicht vorhanden"
         *
         *  Diese Werte entsprechen �brigens den Fehlernummern bei MS-DOS.
         *)

PROCEDURE FormKeyboard (    tree   : PtrObjTree;
                            index  : CARDINAL;
                        VAR nextObj: CARDINAL;
                        VAR ch     : GemChar;
                        VAR cont   : BOOLEAN);
                        
        (*  Diese Prozedur verarbeitet die bei einer Dialogsitzung anfal-
         *  lenden Steuerzeichen.
         *  Es ist 'tree' ein Zeiger auf das Dialogformular und 'index', der
         *  Baumindex des zu edierenden Objekts (= 0, falls keines vorhanden).
         *  'nextObj' ist der Index des n�chsten Objekts und 'ch' enth�lt die
         *  bet�tigte Taste. Falls 'ch' ein Steuerzeichen enth�lt, so wird
         *  dies bearbeitet und 'ch' der Wert 0C zugewiesen, sonst wird 'ch'
         *  nicht ver�ndert und kann mit 'AESObject.EditObjText' weiterver-
         *  arbeitet werden. 'nextObj' liefert das n�chste Objekt.
         *  Ist 'cont = FALSE', so sollte der Teildialog abgebrochen werden,
         *  da zum Beispiel ein mit 'selectExitFlg' gekennzeichnetes Objekt
         *  angew�hlt wurde.
         *)

PROCEDURE FormButton (    tree   : PtrObjTree;
                          index  : CARDINAL;
                          clicks : CARDINAL;
                      VAR nextObj: CARDINAL;
                      VAR cont   : BOOLEAN);
                      
        (*  Mit Hilfe dieser Routine k�nnen die Mausklicks einer Dialog-
         *  sitzung verarbeitet werden.
         *  'tree' ist der Formularbaum und 'index' enth�lt das angeklickte
         *  Objekt. In 'clicks' steht, wie oft der Mausknopf gedr�ckt wurde
         *  und in 'nextObj' wird das n�chste Objekt zur�ckgegeben.
         *  Je nach Objekttyp von 'obj' f�hrt die Routine die entsprechenden
         *  Aktionen aus, wie zum Beispiel Objekt selektieren und Radiokn�pfe
         *  ver�ndern.
         *  Ist 'cont = FALSE', so sollte der Teildialog abgebrochen werden,
         *  da zum Beispiel ein mit 'selectExitFlg' gekennzeichnetes Objekt
         *  angew�hlt wurde.
         *)


END AESForms.
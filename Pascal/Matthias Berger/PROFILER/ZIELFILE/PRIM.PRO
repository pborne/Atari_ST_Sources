PROGRAM prim2;
CONST n = 1000;
VAR   i,k  : integer;    {  I : 3610  Min 1  Max 1001  }
                        {  K : 5884  Min 1  Max 31  }
      prim : boolean;    {  PRIM : 1834  }
BEGIN
  write(2:4);
  i:=1;
  REPEAT   { 500 }
    i:=i+2;
    prim := true;
    k:=1;
    REPEAT  { 2442 }
     k:=k+2;
     IF i MOD k = 0
       THEN prim := false;  { 334 }
    UNTIL (NOT prim) OR (k>=trunc(sqrt(i)));
    IF prim THEN write (i:4)   { 166 }
  UNTIL i>=n;
END.
{ Problemstellung :
  Alle Primzahlen von 1 bis 997 sollen ausgegeben werden.
  Dieses Programm ist durch Profilierung optimiert bis zum gehtfastnichtmehr.
  
  Beispiel :
  
  �berpr�fen Sie die ausgegebenen Werte auf Primzahlen.
  
  Besonderheiten :
  
  Schleifenverhalten, Variablenbereiche 
}
 

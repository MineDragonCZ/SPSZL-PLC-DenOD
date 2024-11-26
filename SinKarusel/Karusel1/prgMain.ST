PROGRAM prgMain
  VAR
     COUNTER_CELISTI : CTU;
     COUNTER_KARUSEL : CTU;
     
     runKarusel : BOOL := true;
     runCelisti : BOOL := false;

     vyrobekCelist1 : BOOL := false;
     vyrobekSwitched : BOOL := false;
  END_VAR
  pulzyMotoru := NOT(pulzyMotoru);
  
  COUNTER_CELISTI(CU := (TIMER AND runCelisti), R := NOT(runCelisti) OR COUNTER_CELISTI.Q, PV := 8);
  COUNTER_KARUSEL(CU := (TIMER AND runKarusel AND polohaKaruseluOK), R := NOT(runKarusel) OR NOT(polohaKaruseluOK) OR COUNTER_KARUSEL.Q, PV := 13);
  
  IF polohaKaruseluOK AND COUNTER_KARUSEL.CV < 2 THEN
     motorEnable := false;
  END_IF

  CASE COUNTER_CELISTI.CV OF
       2:
         motorEnable := false;
         zvedaniChapadel := 1;
         IF NOT(vyrobekSwitched) THEN
            vyrobekSwitched := true;
            vyrobekCelist1 := NOT(vyrobekCelist1);
         END_IF
       ;
       4:
         celist1 := vyrobekCelist1;
         celist2 := NOT(vyrobekCelist1);
       ;
       5:
         zvedaniChapadel := 0;
       ;
       7:
         vyrobekSwitched := false;
         otacebiChapadel := vyrobekCelist1;
         runKarusel := true;
         runCelisti := false;
       ;
  END_CASE;


  CASE COUNTER_KARUSEL.CV OF
       1:
         zarazka := true;
         motorEnable := false;
         //stroj1HoreDole := true;
         //stroj2HoreDole := true;
         runCelisti := true;
       ;
       2:
         vyhod := true;
       ;
       7:
         vyhod := false;
       ;
       9:
         stroj1HoreDole := false;
         stroj2HoreDole := false;
         zarazka := false;
         motorEnable := true;
       ;
  END_CASE;
  
  

END_PROGRAM


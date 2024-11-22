PROGRAM prgMain
  VAR
  
  OFF_DELAY : TON;
  MOVEMENT_COUNTER : CTU;
  VZDUCH_RESET_DELAY : TON;
  
  vyrobekProsel : BOOL;
  
  END_VAR
  
  
  OFF_DELAY(IN := sensor1, PT := t#10s);
  pohon := NOT(OFF_DELAY.Q);
  kompresor := NOT(OFF_DELAY.Q);
  
  MOVEMENT_COUNTER(CU := pasPulzy, R := NOT(vyrobekProsel), PV := 20);
  VZDUCH_RESET_DELAY(IN := NOT(vyrobekProsel), PT := t#500ms);
  
  IF VZDUCH_RESET_DELAY.Q THEN
     vzduch1 := false;
     vzduch2 := false;
     vzduch3 := false;
  END_IF
  
  IF NOT sensor2 THEN
     vyrobekProsel := true;
  END_IF
  
  CASE MOVEMENT_COUNTER.CV OF
       4:
         IF konc1 THEN
            vzduch1 := true;
            vyrobekProsel := false;
         END_IF
       ;
       9:
         IF konc2 THEN
            vzduch2 := true;
            vyrobekProsel := false;
         END_IF
       ;
       14:
         IF konc3 THEN
            vzduch3 := true;
            vyrobekProsel := false;
         END_IF
       ;
       20:
           vyrobekProsel := false;
       ;
  END_CASE;
  
  
  


END_PROGRAM


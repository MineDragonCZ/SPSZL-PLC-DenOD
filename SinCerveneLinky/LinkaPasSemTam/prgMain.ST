PROGRAM prgMain
  VAR
  END_VAR
  
  (*
  TODO: define varibles in global scope as INPUTS/OUTPUTS of the PLC
  *)
  
  IF NOT sensorA THEN
     motorA := true;
     motorB := false;
  END_IF

  IF NOT sensorB THEN
     motorB := true;
     motorA := false;
  END_IF

END_PROGRAM


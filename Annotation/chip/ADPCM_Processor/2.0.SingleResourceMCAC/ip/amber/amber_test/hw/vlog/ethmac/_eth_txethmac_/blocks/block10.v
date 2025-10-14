always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    MTxEn <= #Tp 1'b0;
  else
    MTxEn <= #Tp StatePreamble | (|StateData) | StatePAD | StateFCS | StateJam;
end
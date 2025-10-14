always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    WillTransmit <= #Tp  1'b0;
  else
    WillTransmit <= #Tp StartPreamble | StatePreamble | (|StateData) | StatePAD | StateFCS | StateJam;
end
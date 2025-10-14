always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    StopExcessiveDeferOccured <= #Tp 1'b0;
  else
    begin
      if(~TxStartFrm)
        StopExcessiveDeferOccured <= #Tp 1'b0;
      else
      if(ExcessiveDeferOccured)
        StopExcessiveDeferOccured <= #Tp 1'b1;
    end
end
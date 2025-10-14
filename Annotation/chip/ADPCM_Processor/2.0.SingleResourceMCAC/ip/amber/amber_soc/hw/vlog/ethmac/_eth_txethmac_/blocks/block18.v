always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    StatusLatch <= #Tp 1'b0;
  else
    begin
      if(~TxStartFrm)
        StatusLatch <= #Tp 1'b0;
      else
      if(ExcessiveDeferOccured | StateIdle)
        StatusLatch <= #Tp 1'b1;
     end
end
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxDone <= #Tp 1'b0;
  else
    begin
      if(TxStartFrm & ~StatusLatch)
        TxDone <= #Tp 1'b0;
      else
      if(StartTxDone)
        TxDone <= #Tp 1'b1;
    end
end
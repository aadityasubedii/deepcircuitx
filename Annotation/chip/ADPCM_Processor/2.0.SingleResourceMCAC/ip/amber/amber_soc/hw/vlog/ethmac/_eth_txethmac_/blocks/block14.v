always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxAbort <= #Tp 1'b0;
  else
    begin
      if(TxStartFrm & ~StatusLatch & ~ExcessiveDeferOccured)
        TxAbort <= #Tp 1'b0;
      else
      if(StartTxAbort)
        TxAbort <= #Tp 1'b1;
    end
end
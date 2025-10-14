always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxRetry <= #Tp 1'b0;
  else
    begin
      if(TxStartFrm & ~StatusLatch)
        TxRetry <= #Tp 1'b0;
      else
      if(StartTxRetry)
        TxRetry <= #Tp 1'b1;
     end
end                                    
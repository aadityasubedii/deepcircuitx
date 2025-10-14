always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    MuxedAbort <= #Tp 1'b0;
  else
  if(TxStartFrmIn)
    MuxedAbort <= #Tp 1'b0;
  else
  if(TxAbortIn & ~TxAbortInLatched & TxUsedDataOutDetected)
    MuxedAbort <= #Tp 1'b1;
end
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    MuxedDone <= #Tp 1'b0;
  else
  if(TxStartFrmIn)
    MuxedDone <= #Tp 1'b0;
  else
  if(TxDoneIn & (~TxDoneInLatched) & TxUsedDataOutDetected)
    MuxedDone <= #Tp 1'b1;
end
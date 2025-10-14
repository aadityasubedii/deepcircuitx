always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    TxUsedDataOutDetected <= #Tp 1'b0;
  else
  if(TxDoneIn | TxAbortIn)
    TxUsedDataOutDetected <= #Tp 1'b0;
  else
  if(TxUsedDataOut)
    TxUsedDataOutDetected <= #Tp 1'b1;
end    
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    TxCtrlStartFrm <= #Tp 1'b0;
  else
  if(TxUsedDataIn_q & CtrlMux)
    TxCtrlStartFrm <= #Tp 1'b0;
  else
  if(WillSendControlFrame & ~TxUsedDataOut & (TxDoneIn | TxAbortIn | TxStartFrmIn | (~TxUsedDataOutDetected)))
    TxCtrlStartFrm <= #Tp 1'b1;
end
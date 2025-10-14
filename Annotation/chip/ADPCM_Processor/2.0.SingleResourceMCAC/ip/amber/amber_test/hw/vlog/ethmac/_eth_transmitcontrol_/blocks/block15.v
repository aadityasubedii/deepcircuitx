always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    CtrlMux <= #Tp 1'b0;
  else
  if(WillSendControlFrame & ~TxUsedDataOut)
    CtrlMux <= #Tp 1'b1;
  else
  if(TxDoneIn)
    CtrlMux <= #Tp 1'b0;
end
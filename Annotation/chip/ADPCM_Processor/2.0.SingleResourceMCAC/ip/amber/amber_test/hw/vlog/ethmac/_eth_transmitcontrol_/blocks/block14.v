always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    SendingCtrlFrm <= #Tp 1'b0;
  else
  if(WillSendControlFrame & TxCtrlStartFrm)
    SendingCtrlFrm <= #Tp 1'b1;
  else
  if(TxDoneIn)
    SendingCtrlFrm <= #Tp 1'b0;
end
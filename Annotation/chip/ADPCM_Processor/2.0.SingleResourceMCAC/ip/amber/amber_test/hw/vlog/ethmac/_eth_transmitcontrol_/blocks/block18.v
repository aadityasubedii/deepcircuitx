always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    WillSendControlFrame <= #Tp 1'b0;
  else
  if(TxCtrlEndFrm & CtrlMux)
    WillSendControlFrame <= #Tp 1'b0;
  else
  if(TPauseRq & TxFlow)
    WillSendControlFrame <= #Tp 1'b1;
end
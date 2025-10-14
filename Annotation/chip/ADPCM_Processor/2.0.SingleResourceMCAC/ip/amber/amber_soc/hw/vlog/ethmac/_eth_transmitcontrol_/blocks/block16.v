always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    TxCtrlEndFrm <= #Tp 1'b0;
  else
  if(ControlEnd | ControlEnd_q)
    TxCtrlEndFrm <= #Tp 1'b1;
  else
    TxCtrlEndFrm <= #Tp 1'b0;
end
always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    BlockTxDone <= #Tp 1'b0;
  else
  if(TxCtrlStartFrm)
    BlockTxDone <= #Tp 1'b1;
  else
  if(TxStartFrmIn)
    BlockTxDone <= #Tp 1'b0;
end
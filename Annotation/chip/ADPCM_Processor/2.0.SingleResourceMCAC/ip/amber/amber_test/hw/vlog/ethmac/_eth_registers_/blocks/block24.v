always @ (posedge TxClk or posedge Reset)
begin
  if(Reset)
    SetTxCIrq_txclk <=#Tp 1'b0;
  else
  if(TxCtrlEndFrm & StartTxDone & r_TxFlow)
    SetTxCIrq_txclk <=#Tp 1'b1;
  else
  if(ResetTxCIrq_sync2)
    SetTxCIrq_txclk <=#Tp 1'b0;
end
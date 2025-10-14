always @ (posedge TxClk or posedge Reset)
begin
  if(Reset)
    ResetTxCIrq_sync2 <=#Tp 1'b0;
  else
    ResetTxCIrq_sync2 <=#Tp SetTxCIrq_sync1;
end
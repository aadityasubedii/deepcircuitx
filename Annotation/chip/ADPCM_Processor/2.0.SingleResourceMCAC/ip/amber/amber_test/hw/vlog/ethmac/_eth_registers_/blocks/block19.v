always @ (posedge TxClk or posedge Reset)
begin
  if(Reset)
    ResetTxCIrq_sync1 <=#Tp 1'b0;
  else
    ResetTxCIrq_sync1 <=#Tp SetTxCIrq_sync2;
end
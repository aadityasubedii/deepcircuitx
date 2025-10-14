always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxUnderRun_sync1 <=#Tp 1'b0;
  else
  if(TxUnderRun_wb)
    TxUnderRun_sync1 <=#Tp 1'b1;
  else
  if(BlockingTxStatusWrite_sync2)
    TxUnderRun_sync1 <=#Tp 1'b0;
end
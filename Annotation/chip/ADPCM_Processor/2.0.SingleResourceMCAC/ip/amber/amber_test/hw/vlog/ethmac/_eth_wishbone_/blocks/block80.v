always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxUnderRun <=#Tp 1'b0;
  else
  if(BlockingTxStatusWrite_sync2)
    TxUnderRun <=#Tp 1'b0;
  else
  if(TxUnderRun_sync1)
    TxUnderRun <=#Tp 1'b1;
end
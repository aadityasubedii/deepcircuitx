always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    BlockingTxBDRead <=#Tp 1'b0;
  else
  if(StartTxBDRead)
    BlockingTxBDRead <=#Tp 1'b1;
  else
  if(~StartTxBDRead & ~TxBDReady)
    BlockingTxBDRead <=#Tp 1'b0;
end
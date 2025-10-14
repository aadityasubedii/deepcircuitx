always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    BlockingTxStatusWrite <=#Tp 1'b0;
  else
  if(~TxDone_wb & ~TxAbort_wb)
    BlockingTxStatusWrite <=#Tp 1'b0;
  else
  if(TxStatusWrite)
    BlockingTxStatusWrite <=#Tp 1'b1;
end
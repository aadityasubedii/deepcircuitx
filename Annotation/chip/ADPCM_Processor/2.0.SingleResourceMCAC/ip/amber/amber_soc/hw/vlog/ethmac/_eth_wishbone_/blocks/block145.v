always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxBDRead <=#Tp 1'b1;
  else
  if(StartTxBDRead)
    TxBDRead <=#Tp 1'b1;
  else
  if(TxBDReady)
    TxBDRead <=#Tp 1'b0;
end
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxRetrySync1 <=#Tp 1'b0;
  else
    TxRetrySync1 <=#Tp TxRetry;
end
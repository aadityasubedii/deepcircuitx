always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxRetry_wb <=#Tp 1'b0;
  else
    TxRetry_wb <=#Tp TxRetrySync1;
end
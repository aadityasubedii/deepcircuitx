always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxAbortSync1 <=#Tp 1'b0;
  else
    TxAbortSync1 <=#Tp TxAbort;
end
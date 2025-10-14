always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxAbort_wb <=#Tp 1'b0;
  else
    TxAbort_wb <=#Tp TxAbortSync1;
end
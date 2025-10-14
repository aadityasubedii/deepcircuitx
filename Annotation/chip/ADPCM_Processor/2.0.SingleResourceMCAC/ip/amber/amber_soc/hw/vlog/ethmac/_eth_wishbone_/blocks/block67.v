always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxDone_wb <=#Tp 1'b0;
  else
    TxDone_wb <=#Tp TxDoneSync1;
end
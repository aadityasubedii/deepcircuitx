always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxDoneSync1 <=#Tp 1'b0;
  else
    TxDoneSync1 <=#Tp TxDone;
end
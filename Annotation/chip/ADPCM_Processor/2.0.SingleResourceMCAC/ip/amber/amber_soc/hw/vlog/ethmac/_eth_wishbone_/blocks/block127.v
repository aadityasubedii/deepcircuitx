always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    BlockingIncrementTxPointer <=#Tp 0;
  else
  if(MasterAccessFinished)
    BlockingIncrementTxPointer <=#Tp 0;
  else
  if(IncrTxPointer)
    BlockingIncrementTxPointer <=#Tp 1'b1;
end
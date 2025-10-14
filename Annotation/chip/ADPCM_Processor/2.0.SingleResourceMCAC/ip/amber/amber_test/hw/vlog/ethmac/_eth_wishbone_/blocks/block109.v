always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    LatchValidBytes <=#Tp 1'b0;
  else
  if(TxLengthLt4 & TxBDReady)
    LatchValidBytes <=#Tp 1'b1;
  else
    LatchValidBytes <=#Tp 1'b0;
end
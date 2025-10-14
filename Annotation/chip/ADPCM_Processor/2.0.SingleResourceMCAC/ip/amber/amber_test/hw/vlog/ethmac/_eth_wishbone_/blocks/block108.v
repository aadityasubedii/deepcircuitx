always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    LatchValidBytes_q <=#Tp 1'b0;
  else
    LatchValidBytes_q <=#Tp LatchValidBytes;
end
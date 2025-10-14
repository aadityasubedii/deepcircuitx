always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxAbortSync4 <=#Tp 1'b0;
  else
    RxAbortSync4 <=#Tp RxAbortSync3;
end
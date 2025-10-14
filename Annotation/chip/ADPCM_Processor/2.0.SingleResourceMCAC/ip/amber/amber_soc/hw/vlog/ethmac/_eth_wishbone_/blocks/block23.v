always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxAbortSync3 <=#Tp 1'b0;
  else
    RxAbortSync3 <=#Tp RxAbortSync2;
end
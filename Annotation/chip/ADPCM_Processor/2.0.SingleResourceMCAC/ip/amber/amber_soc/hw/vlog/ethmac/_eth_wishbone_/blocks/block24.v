always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxAbortSync2 <=#Tp 1'b0;
  else
    RxAbortSync2 <=#Tp RxAbortSync1;
end
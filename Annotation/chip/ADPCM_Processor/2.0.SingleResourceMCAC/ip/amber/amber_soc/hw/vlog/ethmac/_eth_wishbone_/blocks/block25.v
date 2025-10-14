always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxAbortSync1 <=#Tp 1'b0;
  else
    RxAbortSync1 <=#Tp RxAbortLatched;
end
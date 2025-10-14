always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxReady <=#Tp 1'b0;
  else
  if(ShiftEnded | RxAbortSync2 & ~RxAbortSync3 | ~r_RxEn & r_RxEn_q)
    RxReady <=#Tp 1'b0;
  else
  if(RxEn & RxEn_q & RxPointerRead)
    RxReady <=#Tp 1'b1;
end
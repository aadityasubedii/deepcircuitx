always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxPointerRead <=#Tp 1'b0;
  else
  if(StartRxPointerRead)
    RxPointerRead <=#Tp 1'b1;
  else
  if(RxEn & RxEn_q)
    RxPointerRead <=#Tp 1'b0;
end
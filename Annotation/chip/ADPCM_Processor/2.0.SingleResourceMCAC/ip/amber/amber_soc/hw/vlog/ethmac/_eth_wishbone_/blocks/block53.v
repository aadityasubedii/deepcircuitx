always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxEn_needed <=#Tp 1'b0;
  else
  if(~RxReady & r_RxEn & WbEn & ~WbEn_q)
    RxEn_needed <=#Tp 1'b1;
  else
  if(RxPointerRead & RxEn & RxEn_q)
    RxEn_needed <=#Tp 1'b0;
end
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxStatus <=#Tp 2'h0;
  else
  if(RxEn & RxEn_q & RxBDRead)
    RxStatus <=#Tp ram_do[14:13];
end
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxBDReady <=#Tp 1'b0;
  else
  if(RxPointerRead)
    RxBDReady <=#Tp 1'b0;
  else
  if(RxEn & RxEn_q & RxBDRead)
    RxBDReady <=#Tp ram_do[15]; 
end
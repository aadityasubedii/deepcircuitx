always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxBDRead <=#Tp 1'b0;
  else
  if(StartRxBDRead & ~RxReady)
    RxBDRead <=#Tp 1'b1;
  else
  if(RxBDReady)
    RxBDRead <=#Tp 1'b0;
end
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxStatusWriteLatched <=#Tp 1'b0;
  else
  if(RxStatusWriteLatched_syncb2)
    RxStatusWriteLatched <=#Tp 1'b0;        
  else
  if(RxStatusWrite)
    RxStatusWriteLatched <=#Tp 1'b1;
end
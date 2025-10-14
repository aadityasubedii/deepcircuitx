always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ShortFrame <=#Tp 1'b0;
  else
  if(LoadRxStatus)
    ShortFrame <=#Tp 1'b0;
  else
  if(TakeSample)
    ShortFrame <=#Tp RxByteCnt[15:0] < r_MinFL[15:0];
end
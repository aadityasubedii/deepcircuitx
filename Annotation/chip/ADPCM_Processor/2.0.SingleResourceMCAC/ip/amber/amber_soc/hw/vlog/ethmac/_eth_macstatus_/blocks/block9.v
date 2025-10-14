always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxColWindow <=#Tp 1'b1;
  else
  if(~Collision & RxByteCnt[5:0] == CollValid[5:0] & RxStateData[1])
    RxColWindow <=#Tp 1'b0;
  else
  if(RxStateIdle)
    RxColWindow <=#Tp 1'b1;
end
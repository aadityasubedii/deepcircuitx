always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxLateCollision <=#Tp 1'b0;
  else
  if(LoadRxStatus)
    RxLateCollision <=#Tp 1'b0;
  else
  if(Collision & (~r_FullD) & (~RxColWindow | r_RecSmall))
    RxLateCollision <=#Tp 1'b1;
end
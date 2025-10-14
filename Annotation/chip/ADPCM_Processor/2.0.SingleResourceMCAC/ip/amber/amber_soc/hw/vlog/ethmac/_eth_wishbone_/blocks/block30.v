always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ShiftEndedSync3 <=#Tp 1'b0;
  else
  if(ShiftEndedSync1 & ~ShiftEndedSync2)
    ShiftEndedSync3 <=#Tp 1'b1;
  else
  if(ShiftEnded)
    ShiftEndedSync3 <=#Tp 1'b0;
end
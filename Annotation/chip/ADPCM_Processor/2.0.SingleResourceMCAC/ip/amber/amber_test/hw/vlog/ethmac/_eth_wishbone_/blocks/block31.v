always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ShiftEndedSync2 <=#Tp 1'b0;
  else
    ShiftEndedSync2 <=#Tp ShiftEndedSync1;
end
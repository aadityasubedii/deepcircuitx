always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ShiftEndedSync1 <=#Tp 1'b0;
  else
    ShiftEndedSync1 <=#Tp ShiftEnded_rck;
end
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ShiftEndedSync_c1 <=#Tp 1'b0;
  else
    ShiftEndedSync_c1 <=#Tp ShiftEndedSync2;
end
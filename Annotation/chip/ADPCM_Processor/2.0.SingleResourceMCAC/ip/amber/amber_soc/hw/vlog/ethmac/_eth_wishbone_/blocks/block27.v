always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ShiftEndedSync_c2 <=#Tp 1'b0;
  else
    ShiftEndedSync_c2 <=#Tp ShiftEndedSync_c1;
end
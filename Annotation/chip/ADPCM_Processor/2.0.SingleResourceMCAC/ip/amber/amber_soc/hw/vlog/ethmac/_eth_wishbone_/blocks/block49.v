always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ShiftWillEnd <=#Tp 1'b0;
  else
  if(ShiftEnded_rck | RxAbort)
    ShiftWillEnd <=#Tp 1'b0;
  else
  if(StartShiftWillEnd)
    ShiftWillEnd <=#Tp 1'b1;
end
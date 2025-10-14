always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ShiftEnded_rck <=#Tp 1'b0;
  else
  if(~RxAbort & SetWriteRxDataToFifo & StartShiftWillEnd)
    ShiftEnded_rck <=#Tp 1'b1;
  else
  if(RxAbort | ShiftEndedSync_c1 & ShiftEndedSync_c2)
    ShiftEnded_rck <=#Tp 1'b0;
end
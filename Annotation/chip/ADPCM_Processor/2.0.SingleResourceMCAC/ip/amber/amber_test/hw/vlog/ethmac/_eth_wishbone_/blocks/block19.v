always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxAbortLatched <=#Tp 1'b0;
  else
  if(RxAbortSyncb2)
    RxAbortLatched <=#Tp 1'b0;
  else
  if(RxAbort)
    RxAbortLatched <=#Tp 1'b1;
end
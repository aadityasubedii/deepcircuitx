always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    LateCollLatched <=#Tp 1'b0;
  else
  if(StartTxDone | StartTxAbort)
    LateCollLatched <=#Tp LateCollision;
end
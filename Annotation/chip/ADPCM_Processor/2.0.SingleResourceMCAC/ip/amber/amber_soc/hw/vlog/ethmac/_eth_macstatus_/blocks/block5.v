always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    RetryCntLatched <=#Tp 4'h0;
  else
  if(StartTxDone | StartTxAbort)
    RetryCntLatched <=#Tp RetryCnt;
end
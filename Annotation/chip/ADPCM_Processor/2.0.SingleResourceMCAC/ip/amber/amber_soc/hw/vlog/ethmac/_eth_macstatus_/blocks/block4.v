always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    RetryLimit <=#Tp 1'h0;
  else
  if(StartTxDone | StartTxAbort)
    RetryLimit <=#Tp MaxCollisionOccured;
end
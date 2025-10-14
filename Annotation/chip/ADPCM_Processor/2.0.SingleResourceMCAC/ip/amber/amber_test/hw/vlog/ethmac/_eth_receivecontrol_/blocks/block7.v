always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    Pause <= #Tp 1'b0;
  else
  if((TxDoneIn | TxAbortIn | ~TxUsedDataOutDetected) & ~TxStartFrmOut)
    Pause <= #Tp RxFlow & ~PauseTimerEq0_sync2;
end
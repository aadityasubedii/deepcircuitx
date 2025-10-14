always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxStartFrm <=#Tp 1'b0;
  else
  if(TxStartFrm_sync2)
    TxStartFrm <=#Tp 1'b1;
  else
  if(TxUsedData_q | ~TxStartFrm_sync2 & (TxRetry & (~TxRetry_q) | TxAbort & (~TxAbort_q)))
    TxStartFrm <=#Tp 1'b0;
end
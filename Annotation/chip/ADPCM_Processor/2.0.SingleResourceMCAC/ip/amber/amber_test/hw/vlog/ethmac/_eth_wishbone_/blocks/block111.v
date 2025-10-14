always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxEndFrm_wb <=#Tp 1'b0;
  else
  if(TxLengthEq0 & TxBufferAlmostEmpty & TxUsedData)
    TxEndFrm_wb <=#Tp 1'b1;
  else
  if(TxRetryPulse | TxDonePulse | TxAbortPulse)
    TxEndFrm_wb <=#Tp 1'b0;
end
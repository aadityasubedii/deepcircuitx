always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxUnderRun_wb <=#Tp 1'b0;
  else
  if(TxAbortPulse)
    TxUnderRun_wb <=#Tp 1'b0;
  else
  if(TxBufferEmpty & ReadTxDataFromFifo_wb)
    TxUnderRun_wb <=#Tp 1'b1;
end
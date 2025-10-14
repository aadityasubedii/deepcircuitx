always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromMemory <=#Tp 1'b0;
  else
  if(TxLengthEq0 | TxAbortPulse | TxRetryPulse)
    ReadTxDataFromMemory <=#Tp 1'b0;
  else
  if(SetReadTxDataFromMemory)
    ReadTxDataFromMemory <=#Tp 1'b1;
end
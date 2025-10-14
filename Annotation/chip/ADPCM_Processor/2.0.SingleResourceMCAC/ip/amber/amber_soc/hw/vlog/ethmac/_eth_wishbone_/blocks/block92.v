always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxRetryPacket <=#Tp 1'b0;
  else
  if(TxRetry_wb & !tx_burst_en & MasterWbTX & MasterAccessFinished & !TxRetryPacketBlocked | 
     TxRetry_wb & !MasterWbTX & !TxRetryPacketBlocked)
    TxRetryPacket <=#Tp 1'b1;
  else
    TxRetryPacket <=#Tp 1'b0;
end
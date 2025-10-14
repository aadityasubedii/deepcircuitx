always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    BlockReadTxDataFromMemory <=#Tp 1'b0;
  else
  if((TxBufferAlmostFull | TxLength <= 4)& MasterWbTX & (~cyc_cleared) & (!(TxAbortPacket_NotCleared | TxRetryPacket_NotCleared)))
    BlockReadTxDataFromMemory <=#Tp 1'b1;
  else
  if(ReadTxDataFromFifo_wb | TxDonePacket | TxAbortPacket | TxRetryPacket)
    BlockReadTxDataFromMemory <=#Tp 1'b0;
end
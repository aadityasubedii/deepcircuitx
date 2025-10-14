always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxAbortPacket <=#Tp 1'b0;
  else
  if(TxAbort_wb & (~tx_burst_en) & MasterWbTX & MasterAccessFinished & (~TxAbortPacketBlocked) |
     TxAbort_wb & (~MasterWbTX) & (~TxAbortPacketBlocked))
    TxAbortPacket <=#Tp 1'b1;
  else
    TxAbortPacket <=#Tp 1'b0;
end
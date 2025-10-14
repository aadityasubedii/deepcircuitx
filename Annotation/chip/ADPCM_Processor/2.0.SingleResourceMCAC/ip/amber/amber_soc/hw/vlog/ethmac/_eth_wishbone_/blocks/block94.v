always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxAbortPacket_NotCleared <=#Tp 1'b0;
  else
  if(TxEn & TxEn_q & TxAbortPacket_NotCleared)
    TxAbortPacket_NotCleared <=#Tp 1'b0;
  else
  if(TxAbort_wb & (~tx_burst_en) & MasterWbTX & MasterAccessFinished & (~TxAbortPacketBlocked) |
     TxAbort_wb & (~MasterWbTX) & (~TxAbortPacketBlocked))
    TxAbortPacket_NotCleared <=#Tp 1'b1;
end
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxDonePacket_NotCleared <=#Tp 1'b0;
  else
  if(TxEn & TxEn_q & TxDonePacket_NotCleared)
    TxDonePacket_NotCleared <=#Tp 1'b0;
  else
  if(TxDone_wb & !tx_burst_en & MasterWbTX & MasterAccessFinished & (~TxDonePacketBlocked) | 
     TxDone_wb & !MasterWbTX & (~TxDonePacketBlocked))
    TxDonePacket_NotCleared <=#Tp 1'b1;
end
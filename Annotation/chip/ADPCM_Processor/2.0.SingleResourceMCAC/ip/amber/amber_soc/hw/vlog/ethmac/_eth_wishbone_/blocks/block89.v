always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxDonePacket <=#Tp 1'b0;
  else
  if(TxDone_wb & !tx_burst_en & MasterWbTX & MasterAccessFinished & !TxDonePacketBlocked | 
     TxDone_wb & !MasterWbTX & !TxDonePacketBlocked)
    TxDonePacket <=#Tp 1'b1;
  else
    TxDonePacket <=#Tp 1'b0;
end
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxAbortPacketBlocked <=#Tp 1'b0;
  else
  if(!TxAbort_wb & TxAbort_wb_q)
    TxAbortPacketBlocked <=#Tp 1'b0;
  else
  if(TxAbortPacket)
    TxAbortPacketBlocked <=#Tp 1'b1;
end
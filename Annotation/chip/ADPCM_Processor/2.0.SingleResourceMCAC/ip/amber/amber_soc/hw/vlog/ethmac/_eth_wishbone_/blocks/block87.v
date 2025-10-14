always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxDonePacketBlocked <=#Tp 1'b0;
  else
  if(!TxDone_wb & TxDone_wb_q)
    TxDonePacketBlocked <=#Tp 1'b0;
  else
  if(TxDonePacket)
    TxDonePacketBlocked <=#Tp 1'b1;
end
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxRetryPacketBlocked <=#Tp 1'b0;
  else
  if(!TxRetry_wb & TxRetry_wb_q)
    TxRetryPacketBlocked <=#Tp 1'b0;
  else
  if(TxRetryPacket)
    TxRetryPacketBlocked <=#Tp 1'b1;
end
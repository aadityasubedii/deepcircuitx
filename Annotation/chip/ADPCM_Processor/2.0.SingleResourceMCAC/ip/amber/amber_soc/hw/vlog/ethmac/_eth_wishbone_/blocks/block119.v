always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxStartFrm_wb <=#Tp 1'b0;
  else
  if(TxBDReady & ~StartOccured & (TxBufferFull | TxLengthEq0))
    TxStartFrm_wb <=#Tp 1'b1;
  else
  if(TxStartFrm_syncb2)
    TxStartFrm_wb <=#Tp 1'b0;
end
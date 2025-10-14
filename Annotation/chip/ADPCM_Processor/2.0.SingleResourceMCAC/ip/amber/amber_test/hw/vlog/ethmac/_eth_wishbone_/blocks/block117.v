always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    StartOccured <=#Tp 1'b0;
  else
  if(TxStartFrm_wb)
    StartOccured <=#Tp 1'b1;
  else
  if(ResetTxBDReady)
    StartOccured <=#Tp 1'b0;
end
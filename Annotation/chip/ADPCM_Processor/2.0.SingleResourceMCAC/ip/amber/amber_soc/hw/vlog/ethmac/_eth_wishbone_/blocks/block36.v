always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    SyncRxStartFrm_q <=#Tp 0;
  else
    SyncRxStartFrm_q <=#Tp SyncRxStartFrm;
end
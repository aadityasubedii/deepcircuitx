always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    SyncRxStartFrm_q2 <=#Tp 0;
  else
    SyncRxStartFrm_q2 <=#Tp SyncRxStartFrm_q;
end
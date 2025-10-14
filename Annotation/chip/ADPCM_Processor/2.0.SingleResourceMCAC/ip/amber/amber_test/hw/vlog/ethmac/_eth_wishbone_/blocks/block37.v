always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    SyncRxStartFrm <=#Tp 0;
  else
  if(LatchedRxStartFrm)
    SyncRxStartFrm <=#Tp 1;
  else
    SyncRxStartFrm <=#Tp 0;
end
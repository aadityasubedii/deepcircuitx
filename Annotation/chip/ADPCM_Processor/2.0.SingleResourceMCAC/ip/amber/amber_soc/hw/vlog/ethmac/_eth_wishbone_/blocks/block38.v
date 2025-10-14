always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    LatchedRxStartFrm <=#Tp 0;
  else
  if(RxStartFrm & ~SyncRxStartFrm_q)
    LatchedRxStartFrm <=#Tp 1;
  else
  if(SyncRxStartFrm_q)
    LatchedRxStartFrm <=#Tp 0;
end
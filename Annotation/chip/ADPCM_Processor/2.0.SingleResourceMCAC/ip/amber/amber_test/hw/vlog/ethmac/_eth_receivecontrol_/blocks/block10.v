always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    PauseTimer[15:0] <= #Tp 16'h0;
  else
  if(SetPauseTimer)
    PauseTimer[15:0] <= #Tp LatchedTimerValue[15:0];
  else
  if(DecrementPauseTimer)
    PauseTimer[15:0] <= #Tp PauseTimer[15:0] - 1'b1;
end
always @ (posedge MRxClk or posedge RxReset )
begin
  if(RxReset)
    LatchedTimerValue[15:0] <= #Tp 16'h0;
  else
  if(DetectionWindow &  ReceivedPauseFrmWAddr &  ByteCntEq18)
    LatchedTimerValue[15:0] <= #Tp AssembledTimerValue[15:0];
  else
  if(ReceiveEnd)
    LatchedTimerValue[15:0] <= #Tp 16'h0;
end
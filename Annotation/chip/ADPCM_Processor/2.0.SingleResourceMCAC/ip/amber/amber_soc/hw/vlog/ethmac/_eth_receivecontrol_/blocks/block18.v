always @ (posedge MRxClk or posedge RxReset )
begin
  if(RxReset)
    DetectionWindow <= #Tp 1'b1;
  else
  if(ByteCntEq18)
    DetectionWindow <= #Tp 1'b0;
  else
  if(ReceiveEnd)
    DetectionWindow <= #Tp 1'b1;
end
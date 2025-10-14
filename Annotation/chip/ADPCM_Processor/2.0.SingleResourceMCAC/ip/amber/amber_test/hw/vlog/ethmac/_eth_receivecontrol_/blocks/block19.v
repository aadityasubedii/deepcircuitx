always @ (posedge MRxClk or posedge RxReset )
begin
  if(RxReset)
    AssembledTimerValue[15:0] <= #Tp 16'h0;
  else
  if(RxStartFrm)
    AssembledTimerValue[15:0] <= #Tp 16'h0;
  else
    begin
      if(DetectionWindow & ByteCntEq16)
        AssembledTimerValue[15:8] <= #Tp RxData[7:0];
      if(DetectionWindow & ByteCntEq17)
        AssembledTimerValue[7:0] <= #Tp RxData[7:0];
    end
end
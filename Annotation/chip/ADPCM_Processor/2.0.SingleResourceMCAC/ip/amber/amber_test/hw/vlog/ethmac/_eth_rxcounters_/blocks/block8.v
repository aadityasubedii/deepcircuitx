always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ByteCnt[15:0] <= #Tp 16'h0;
  else
    begin
      if(ResetByteCounter)
        ByteCnt[15:0] <= #Tp 16'h0;
      else
      if(IncrementByteCounter)
        ByteCnt[15:0] <= #Tp ByteCnt[15:0] + 1'b1;
     end
end
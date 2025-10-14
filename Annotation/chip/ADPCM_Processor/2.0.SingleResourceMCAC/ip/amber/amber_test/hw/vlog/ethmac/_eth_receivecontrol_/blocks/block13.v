always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    ByteCnt[4:0] <= #Tp 5'h0;
  else
  if(ResetByteCnt)
    ByteCnt[4:0] <= #Tp 5'h0;
  else
  if(IncrementByteCnt)
    ByteCnt[4:0] <= #Tp ByteCnt[4:0] + 1'b1;
end
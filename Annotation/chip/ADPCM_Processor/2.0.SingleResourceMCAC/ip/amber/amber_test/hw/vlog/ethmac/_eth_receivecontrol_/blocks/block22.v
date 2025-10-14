always @ (posedge MRxClk or posedge RxReset )
begin
  if(RxReset)
    TypeLengthOK <= #Tp 1'b0;
  else
  if(DetectionWindow & ByteCntEq12)
    TypeLengthOK <= #Tp ByteCntEq12 & (RxData[7:0] == TypeLength[15:8]);
  else
  if(DetectionWindow & ByteCntEq13)
    TypeLengthOK <= #Tp ByteCntEq13 & (RxData[7:0] == TypeLength[7:0]) & TypeLengthOK;
  else
  if(ReceiveEnd)
    TypeLengthOK <= #Tp 1'b0;
end
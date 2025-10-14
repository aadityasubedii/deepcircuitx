always @ (posedge MRxClk or posedge RxReset )
begin
  if(RxReset)
    ReceivedPauseFrmWAddr <= #Tp 1'b0;
  else
  if(ReceiveEnd)
    ReceivedPauseFrmWAddr <= #Tp 1'b0;
  else
  if(ByteCntEq16 & TypeLengthOK & OpCodeOK & AddressOK)
    ReceivedPauseFrmWAddr <= #Tp 1'b1;        
end
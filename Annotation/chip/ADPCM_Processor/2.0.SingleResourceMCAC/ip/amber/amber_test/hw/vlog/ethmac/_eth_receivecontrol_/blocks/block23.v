always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    AddressOK <= #Tp 1'b0;
  else
  if(DetectionWindow & ByteCntEq0)
    AddressOK <= #Tp  RxData[7:0] == ReservedMulticast[47:40] | RxData[7:0] == MAC[47:40];
  else
  if(DetectionWindow & ByteCntEq1)
    AddressOK <= #Tp (RxData[7:0] == ReservedMulticast[39:32] | RxData[7:0] == MAC[39:32]) & AddressOK;
  else
  if(DetectionWindow & ByteCntEq2)
    AddressOK <= #Tp (RxData[7:0] == ReservedMulticast[31:24] | RxData[7:0] == MAC[31:24]) & AddressOK;
  else
  if(DetectionWindow & ByteCntEq3)
    AddressOK <= #Tp (RxData[7:0] == ReservedMulticast[23:16] | RxData[7:0] == MAC[23:16]) & AddressOK;
  else
  if(DetectionWindow & ByteCntEq4)
    AddressOK <= #Tp (RxData[7:0] == ReservedMulticast[15:8]  | RxData[7:0] == MAC[15:8])  & AddressOK;
  else
  if(DetectionWindow & ByteCntEq5)
    AddressOK <= #Tp (RxData[7:0] == ReservedMulticast[7:0]   | RxData[7:0] == MAC[7:0])   & AddressOK;
  else
  if(ReceiveEnd)
    AddressOK <= #Tp 1'b0;
end
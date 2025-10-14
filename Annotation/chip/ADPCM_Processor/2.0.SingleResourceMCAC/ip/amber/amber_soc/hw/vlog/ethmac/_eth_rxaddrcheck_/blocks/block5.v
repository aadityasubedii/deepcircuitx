always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    MulticastOK <= #Tp 1'b0;
  else if(RxEndFrm | RxAbort)
    MulticastOK <= #Tp 1'b0;
  else if(CrcHashGood & Multicast)
    MulticastOK <= #Tp HashBit;
end
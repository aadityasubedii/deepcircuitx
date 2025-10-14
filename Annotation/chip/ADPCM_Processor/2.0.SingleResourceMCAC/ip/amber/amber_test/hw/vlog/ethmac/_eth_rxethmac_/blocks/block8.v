always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    Multicast <= #Tp 1'b0;
  else
    begin      
      if(StateData[0] & ByteCntEq1 & LatchedByte[0])
        Multicast <= #Tp 1'b1;
      else if(RxAbort | RxEndFrm)
      Multicast <= #Tp 1'b0;
    end
end
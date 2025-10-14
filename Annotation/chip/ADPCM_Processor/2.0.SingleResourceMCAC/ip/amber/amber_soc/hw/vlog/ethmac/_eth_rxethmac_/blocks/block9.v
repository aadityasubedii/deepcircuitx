always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    Broadcast <= #Tp 1'b0;
  else
    begin      
      if(StateData[0] & ~(&LatchedByte[7:0]) & ByteCntSmall7)
        Broadcast <= #Tp 1'b0;
      else
      if(StateData[0] & (&LatchedByte[7:0]) & ByteCntEq1)
        Broadcast <= #Tp 1'b1;
      else
      if(RxAbort | RxEndFrm)
        Broadcast <= #Tp 1'b0;
    end
end
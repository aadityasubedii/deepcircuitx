always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxAbort <= #Tp 1'b0;
  else if(RxAddressInvalid & ByteCntEq7 & RxCheckEn)
    RxAbort <= #Tp 1'b1;
  else
    RxAbort <= #Tp 1'b0;
end
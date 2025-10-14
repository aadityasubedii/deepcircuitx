always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    AddressMiss <= #Tp 1'b0;
  else if(ByteCntEq7 & RxCheckEn)
    AddressMiss <= #Tp (~(UnicastOK | BroadcastOK | MulticastOK | (PassAll & ControlFrmAddressOK)));
end
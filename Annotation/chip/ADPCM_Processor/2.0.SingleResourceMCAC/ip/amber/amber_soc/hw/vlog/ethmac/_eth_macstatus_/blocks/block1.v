always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    CarrierSenseLost <=#Tp 1'b0;
  else
  if((StatePreamble | (|StateData)) & ~CarrierSense & ~Loopback & ~Collision & ~r_FullD)
    CarrierSenseLost <=#Tp 1'b1;
  else
  if(TxStartFrm)
    CarrierSenseLost <=#Tp 1'b0;
end
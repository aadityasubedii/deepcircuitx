always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    UpdateMIIRX_DATAReg <= #Tp 0;
  else
  if(EndBusy & ~WCtrlDataStart_q)
    UpdateMIIRX_DATAReg <= #Tp 1;
  else
    UpdateMIIRX_DATAReg <= #Tp 0;    
end
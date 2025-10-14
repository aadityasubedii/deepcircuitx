always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    MTxErr <= #Tp 1'b0;
  else
    MTxErr <= #Tp TooBig | UnderRun;
end
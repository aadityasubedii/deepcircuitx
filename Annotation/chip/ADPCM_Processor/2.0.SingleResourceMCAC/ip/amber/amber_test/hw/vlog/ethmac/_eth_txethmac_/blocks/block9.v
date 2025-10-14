always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    MTxD[3:0] <= #Tp 4'h0;
  else
    MTxD[3:0] <= #Tp MTxD_d[3:0];
end
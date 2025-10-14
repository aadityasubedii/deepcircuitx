always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    x[9:0] <= #Tp 0;
  else
    x[9:0] <= #Tp {x[8:0], Feedback};
end
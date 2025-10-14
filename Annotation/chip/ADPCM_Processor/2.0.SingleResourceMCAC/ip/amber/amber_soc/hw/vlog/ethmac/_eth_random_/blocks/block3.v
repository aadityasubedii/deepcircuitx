always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    RandomLatched <= #Tp 10'h000;
  else
    begin
      if(StateJam & StateJam_q)
        RandomLatched <= #Tp Random;
    end
end
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    Rule1 <= #Tp 1'b0;
  else
    begin
      if(StateIdle | StateBackOff)
        Rule1 <= #Tp 1'b0;
      else
      if(StatePreamble | FullD)
        Rule1 <= #Tp 1'b1;
    end
end
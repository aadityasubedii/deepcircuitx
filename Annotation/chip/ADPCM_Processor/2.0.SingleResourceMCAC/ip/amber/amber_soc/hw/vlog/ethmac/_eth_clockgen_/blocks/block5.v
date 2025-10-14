always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    Counter[7:0] <= #Tp 8'h1;
  else
    begin
      if(CountEq0)
        begin
          Counter[7:0] <= #Tp CounterPreset[7:0];
        end
      else
        Counter[7:0] <= #Tp Counter - 8'h1;
    end
end
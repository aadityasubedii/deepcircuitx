always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    Mdc <= #Tp 1'b0;
  else
    begin
      if(CountEq0)
        Mdc <= #Tp ~Mdc;
    end
end
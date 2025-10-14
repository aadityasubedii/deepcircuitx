always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    IFGCounter[4:0] <= #Tp 5'h0;
  else
    begin
      if(ResetIFGCounter)
        IFGCounter[4:0] <= #Tp 5'h0;
      else
      if(IncrementIFGCounter)
        IFGCounter[4:0] <= #Tp IFGCounter[4:0] + 1'b1; 
    end
end
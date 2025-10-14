always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    NibCnt <= #Tp 16'h0;
  else
    begin
      if(ResetNibCnt)
        NibCnt <= #Tp 16'h0;
      else
      if(IncrementNibCnt)
        NibCnt <= #Tp NibCnt + 1'b1;
     end
end
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    ByteCnt[15:0] <= #Tp 16'h0;
  else
    begin
      if(ResetByteCnt)
        ByteCnt[15:0] <= #Tp 16'h0;
      else
      if(IncrementByteCnt)
        ByteCnt[15:0] <= #Tp ByteCnt[15:0] + 1'b1;
    end
end
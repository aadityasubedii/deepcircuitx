always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    ColWindow <= #Tp 1'b1;
  else
    begin  
      if(~Collision & ByteCnt[5:0] == CollValid[5:0] & (StateData[1] | StatePAD & NibCnt[0] | StateFCS & NibCnt[0]))
        ColWindow <= #Tp 1'b0;
      else
      if(StateIdle | StateIPG)
        ColWindow <= #Tp 1'b1;
    end
end
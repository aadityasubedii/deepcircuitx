always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    DlyCrcCnt <= #Tp 3'h0;
  else
    begin        
      if(StateData[1] & DlyCrcCnt == 3'h4 | StartJam | PacketFinished_q)
        DlyCrcCnt <= #Tp 3'h0;
      else
      if(DlyCrcEn & (StateSFD | StateData[1] & (|DlyCrcCnt[2:0])))
        DlyCrcCnt <= #Tp DlyCrcCnt + 1'b1;
    end
end
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    begin
      PacketFinished <= #Tp 1'b0;
      PacketFinished_q  <= #Tp 1'b0;
    end
  else
    begin
      PacketFinished <= #Tp PacketFinished_d;
      PacketFinished_q  <= #Tp PacketFinished;
    end
end
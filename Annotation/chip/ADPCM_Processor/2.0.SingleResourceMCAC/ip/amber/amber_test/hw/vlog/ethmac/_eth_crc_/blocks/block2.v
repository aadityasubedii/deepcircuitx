always @ (posedge Clk or posedge Reset)
begin
  if (Reset)
    Crc <= #1 32'hffffffff;
  else
  if(Initialize)
    Crc <= #Tp 32'hffffffff;
  else
    Crc <= #Tp CrcNext;
end
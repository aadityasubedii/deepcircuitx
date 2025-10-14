always @ (posedge MRxClk)
begin
  if(Reset | StateIdle)
    CrcHash[5:0] <= #Tp 6'h0;
  else
  if(StateData[0] & ByteCntEq6)
    CrcHash[5:0] <= #Tp Crc[31:26];
end
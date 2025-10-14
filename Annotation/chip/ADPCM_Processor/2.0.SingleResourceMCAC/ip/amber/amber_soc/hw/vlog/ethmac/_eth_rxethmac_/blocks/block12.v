always @ (posedge MRxClk)
begin
  CrcHashGood <= #Tp StateData[0] & ByteCntEq6;
end
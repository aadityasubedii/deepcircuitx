always @ (StatePreamble or StateData or StateData or StateFCS or StateJam or StateSFD or TxData or 
          Crc or NibCntEq15)
begin
  if(StateData[0])
    MTxD_d[3:0] = TxData[3:0];                                  
  else
  if(StateData[1])
    MTxD_d[3:0] = TxData[7:4];                                  
  else
  if(StateFCS)
    MTxD_d[3:0] = {~Crc[28], ~Crc[29], ~Crc[30], ~Crc[31]};     
  else
  if(StateJam)
    MTxD_d[3:0] = 4'h9;                                         
  else
  if(StatePreamble)
    if(NibCntEq15)
      MTxD_d[3:0] = 4'hd;                                       
    else
      MTxD_d[3:0] = 4'h5;                                       
  else
    MTxD_d[3:0] = 4'h0;
end
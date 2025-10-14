always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_syncb1 <=#Tp 1'b0;
  else
    ReadTxDataFromFifo_syncb1 <=#Tp ReadTxDataFromFifo_sync2;
end
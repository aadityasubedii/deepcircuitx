always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_syncb3 <=#Tp 1'b0;
  else
    ReadTxDataFromFifo_syncb3 <=#Tp ReadTxDataFromFifo_syncb2;
end
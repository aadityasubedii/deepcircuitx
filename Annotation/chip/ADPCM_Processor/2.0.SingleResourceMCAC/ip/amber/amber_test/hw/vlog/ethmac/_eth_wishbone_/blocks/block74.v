always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_syncb2 <=#Tp 1'b0;
  else
    ReadTxDataFromFifo_syncb2 <=#Tp ReadTxDataFromFifo_syncb1;
end
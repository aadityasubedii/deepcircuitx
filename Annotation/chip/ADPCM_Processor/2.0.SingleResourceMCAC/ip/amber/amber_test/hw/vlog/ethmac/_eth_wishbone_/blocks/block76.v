always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_sync2 <=#Tp 1'b0;
  else
    ReadTxDataFromFifo_sync2 <=#Tp ReadTxDataFromFifo_sync1;
end
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_sync1 <=#Tp 1'b0;
  else
    ReadTxDataFromFifo_sync1 <=#Tp ReadTxDataFromFifo_tck;
end
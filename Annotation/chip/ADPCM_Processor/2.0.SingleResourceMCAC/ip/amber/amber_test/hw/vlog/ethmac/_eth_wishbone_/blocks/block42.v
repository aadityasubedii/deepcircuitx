always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    WriteRxDataToFifoSync1 <=#Tp 1'b0;
  else
  if(WriteRxDataToFifo)
    WriteRxDataToFifoSync1 <=#Tp 1'b1;
  else
    WriteRxDataToFifoSync1 <=#Tp 1'b0;
end
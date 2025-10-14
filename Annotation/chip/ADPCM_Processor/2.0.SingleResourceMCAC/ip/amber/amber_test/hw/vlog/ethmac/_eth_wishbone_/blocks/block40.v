always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    WriteRxDataToFifoSync3 <=#Tp 1'b0;
  else
    WriteRxDataToFifoSync3 <=#Tp WriteRxDataToFifoSync2;
end
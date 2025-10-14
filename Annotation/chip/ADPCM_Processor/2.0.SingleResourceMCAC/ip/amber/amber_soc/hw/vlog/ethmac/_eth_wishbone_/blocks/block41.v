always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    WriteRxDataToFifoSync2 <=#Tp 1'b0;
  else
    WriteRxDataToFifoSync2 <=#Tp WriteRxDataToFifoSync1;
end
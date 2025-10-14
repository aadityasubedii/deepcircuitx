always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxOverrun <=#Tp 1'b0;
  else
  if(RxStatusWrite)
    RxOverrun <=#Tp 1'b0;
  else
  if(RxBufferFull & WriteRxDataToFifo_wb)
    RxOverrun <=#Tp 1'b1;
end
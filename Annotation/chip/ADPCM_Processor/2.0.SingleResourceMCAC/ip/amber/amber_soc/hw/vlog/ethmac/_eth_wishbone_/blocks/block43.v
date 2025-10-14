always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    WriteRxDataToFifo <=#Tp 1'b0;
  else
  if(SetWriteRxDataToFifo & ~RxAbort)
    WriteRxDataToFifo <=#Tp 1'b1;
  else
  if(WriteRxDataToFifoSync2 | RxAbort)
    WriteRxDataToFifo <=#Tp 1'b0;
end
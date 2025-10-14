always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    LastByteIn <=#Tp 1'b0;
  else
  if(ShiftWillEnd & (&RxByteCnt) | RxAbort)
    LastByteIn <=#Tp 1'b0;
  else
  if(RxValid & RxReady & RxEndFrm & ~(&RxByteCnt) & RxEnableWindow)
    LastByteIn <=#Tp 1'b1;
end
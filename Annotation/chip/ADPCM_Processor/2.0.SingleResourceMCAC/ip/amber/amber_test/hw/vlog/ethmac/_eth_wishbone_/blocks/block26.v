always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxEnableWindow <=#Tp 1'b0;
  else
  if(RxStartFrm)
    RxEnableWindow <=#Tp 1'b1;
  else
  if(RxEndFrm | RxAbort)
    RxEnableWindow <=#Tp 1'b0;
end
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    Busy_IRQ_rck <=#Tp 1'b0;
  else
  if(RxValid & RxStartFrm & ~RxReady)
    Busy_IRQ_rck <=#Tp 1'b1;
  else
  if(Busy_IRQ_syncb2)
    Busy_IRQ_rck <=#Tp 1'b0;
end
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    DeferLatched <=#Tp 1'b0;
  else
  if(DeferIndication)
    DeferLatched <=#Tp 1'b1;
  else
  if(RstDeferLatched)
    DeferLatched <=#Tp 1'b0;
end
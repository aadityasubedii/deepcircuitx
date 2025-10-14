always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxE_IRQ <=#Tp 1'b0;
  else
  if(RxStatusWrite & RxIRQEn & (~ReceivedPauseFrm | ReceivedPauseFrm & r_PassAll & (~r_RxFlow)))
    RxE_IRQ <=#Tp RxError;
  else
    RxE_IRQ <=#Tp 1'b0;
end
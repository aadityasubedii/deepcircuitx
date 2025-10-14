always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    RxB_IRQ <=#Tp 1'b0;
  else
  if(RxStatusWrite & RxIRQEn & ReceivedPacketGood & (~ReceivedPauseFrm | ReceivedPauseFrm & r_PassAll & (~r_RxFlow)))
    RxB_IRQ <=#Tp (~RxError);
  else
    RxB_IRQ <=#Tp 1'b0;
end
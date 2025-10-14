always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxE_IRQ <=#Tp 1'b0;
  else
  if(TxStatusWrite & TxIRQEn)
    TxE_IRQ <=#Tp TxError;
  else
    TxE_IRQ <=#Tp 1'b0;
end
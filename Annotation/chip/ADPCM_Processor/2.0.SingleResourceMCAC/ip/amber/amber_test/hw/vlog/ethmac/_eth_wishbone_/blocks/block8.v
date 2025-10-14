always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxB_IRQ <=#Tp 1'b0;
  else
  if(TxStatusWrite & TxIRQEn)
    TxB_IRQ <=#Tp ~TxError;
  else
    TxB_IRQ <=#Tp 1'b0;
end
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    TxPointerMSB <=#Tp 30'h0;
  else
  if(TxEn & TxEn_q & TxPointerRead)
    TxPointerMSB <=#Tp ram_do[31:2];
  else
  if(IncrTxPointer & ~BlockingIncrementTxPointer)
    TxPointerMSB <=#Tp TxPointerMSB + 1'b1;     
end
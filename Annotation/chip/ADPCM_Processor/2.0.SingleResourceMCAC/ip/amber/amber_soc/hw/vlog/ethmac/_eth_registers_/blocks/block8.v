always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_txe <= 1'b0;
  else
  if(TxE_IRQ)
    irq_txe <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr[0] & DataIn[1])
    irq_txe <= #Tp 1'b0;
end
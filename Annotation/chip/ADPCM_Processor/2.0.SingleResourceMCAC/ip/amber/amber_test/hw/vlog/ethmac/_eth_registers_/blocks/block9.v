always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_txb <= 1'b0;
  else
  if(TxB_IRQ)
    irq_txb <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr[0] & DataIn[0])
    irq_txb <= #Tp 1'b0;
end
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_rxe <= 1'b0;
  else
  if(RxE_IRQ)
    irq_rxe <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr[0] & DataIn[3])
    irq_rxe <= #Tp 1'b0;
end
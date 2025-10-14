always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_rxb <= 1'b0;
  else
  if(RxB_IRQ)
    irq_rxb <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr[0] & DataIn[2])
    irq_rxb <= #Tp 1'b0;
end
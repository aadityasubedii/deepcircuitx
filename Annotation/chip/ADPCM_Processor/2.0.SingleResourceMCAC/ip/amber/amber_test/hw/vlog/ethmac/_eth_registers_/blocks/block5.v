always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_busy <= 1'b0;
  else
  if(Busy_IRQ)
    irq_busy <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr[0] & DataIn[4])
    irq_busy <= #Tp 1'b0;
end
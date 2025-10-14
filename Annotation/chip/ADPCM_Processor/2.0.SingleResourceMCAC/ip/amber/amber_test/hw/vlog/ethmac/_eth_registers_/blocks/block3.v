always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_rxc <= 1'b0;
  else
  if(SetRxCIrq)
    irq_rxc <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr[0] & DataIn[6])
    irq_rxc <= #Tp 1'b0;
end
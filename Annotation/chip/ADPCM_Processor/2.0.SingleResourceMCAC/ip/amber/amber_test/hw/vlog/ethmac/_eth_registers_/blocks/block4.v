always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    irq_txc <= 1'b0;
  else
  if(SetTxCIrq)
    irq_txc <= #Tp 1'b1;
  else
  if(INT_SOURCE_Wr[0] & DataIn[5])
    irq_txc <= #Tp 1'b0;
end
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetRxCIrq_sync1 <=#Tp 1'b0;
  else
    SetRxCIrq_sync1 <=#Tp SetRxCIrq_rxclk;
end
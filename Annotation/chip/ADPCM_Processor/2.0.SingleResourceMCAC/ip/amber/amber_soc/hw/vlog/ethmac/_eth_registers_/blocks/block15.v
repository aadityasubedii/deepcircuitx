always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetRxCIrq_sync2 <=#Tp 1'b0;
  else
    SetRxCIrq_sync2 <=#Tp SetRxCIrq_sync1;
end
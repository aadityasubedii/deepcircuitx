always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetRxCIrq <=#Tp 1'b0;
  else
    SetRxCIrq <=#Tp SetRxCIrq_sync2 & ~SetRxCIrq_sync3;
end
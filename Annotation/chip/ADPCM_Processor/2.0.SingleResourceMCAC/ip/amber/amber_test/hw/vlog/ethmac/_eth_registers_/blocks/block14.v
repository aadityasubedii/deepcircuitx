always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetRxCIrq_sync3 <=#Tp 1'b0;
  else
    SetRxCIrq_sync3 <=#Tp SetRxCIrq_sync2;
end
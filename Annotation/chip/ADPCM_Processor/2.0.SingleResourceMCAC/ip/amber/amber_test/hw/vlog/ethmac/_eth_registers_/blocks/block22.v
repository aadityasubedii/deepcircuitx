always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetTxCIrq_sync2 <=#Tp 1'b0;
  else
    SetTxCIrq_sync2 <=#Tp SetTxCIrq_sync1;
end
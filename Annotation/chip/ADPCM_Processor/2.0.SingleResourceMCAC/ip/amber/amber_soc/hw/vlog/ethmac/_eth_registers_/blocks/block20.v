always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetTxCIrq <=#Tp 1'b0;
  else
    SetTxCIrq <=#Tp SetTxCIrq_sync2 & ~SetTxCIrq_sync3;
end
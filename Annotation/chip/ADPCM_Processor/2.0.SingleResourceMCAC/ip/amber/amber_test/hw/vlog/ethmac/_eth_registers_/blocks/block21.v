always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetTxCIrq_sync3 <=#Tp 1'b0;
  else
    SetTxCIrq_sync3 <=#Tp SetTxCIrq_sync2;
end
always @ (posedge Clk or posedge Reset)
begin
  if(Reset)
    SetTxCIrq_sync1 <=#Tp 1'b0;
  else
    SetTxCIrq_sync1 <=#Tp SetTxCIrq_txclk;
end
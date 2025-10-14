always @ (posedge RxClk or posedge Reset)
begin
  if(Reset)
    SetRxCIrq_rxclk <=#Tp 1'b0;
  else
  if(SetPauseTimer & r_RxFlow)
    SetRxCIrq_rxclk <=#Tp 1'b1;
  else
  if(ResetRxCIrq_sync2 & (~ResetRxCIrq_sync3))
    SetRxCIrq_rxclk <=#Tp 1'b0;
end
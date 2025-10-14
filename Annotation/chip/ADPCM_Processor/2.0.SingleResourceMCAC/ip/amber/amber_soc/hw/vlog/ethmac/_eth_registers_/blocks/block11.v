always @ (posedge RxClk or posedge Reset)
begin
  if(Reset)
    ResetRxCIrq_sync2 <=#Tp 1'b0;
  else
    ResetRxCIrq_sync2 <=#Tp ResetRxCIrq_sync1;
end
always @ (posedge RxClk or posedge Reset)
begin
  if(Reset)
    ResetRxCIrq_sync1 <=#Tp 1'b0;
  else
    ResetRxCIrq_sync1 <=#Tp SetRxCIrq_sync2;
end
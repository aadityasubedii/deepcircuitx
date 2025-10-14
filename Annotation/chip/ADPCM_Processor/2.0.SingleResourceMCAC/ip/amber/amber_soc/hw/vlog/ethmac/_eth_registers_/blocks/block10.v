always @ (posedge RxClk or posedge Reset)
begin
  if(Reset)
    ResetRxCIrq_sync3 <=#Tp 1'b0;
  else
    ResetRxCIrq_sync3 <=#Tp ResetRxCIrq_sync2;
end
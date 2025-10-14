always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    ReceivedPauseFrm <=#Tp 1'b0;
  else
  if(RxStatusWriteLatched_sync2 & r_PassAll | ReceivedPauseFrm & (~r_PassAll))
    ReceivedPauseFrm <=#Tp 1'b0;
  else
  if(ByteCntEq16 & TypeLengthOK & OpCodeOK)
    ReceivedPauseFrm <=#Tp 1'b1;        
end
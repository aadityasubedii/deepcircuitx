always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    LatchedMRxErr <=#Tp 1'b0;
  else
  if(MRxErr & MRxDV & (RxStatePreamble | RxStateSFD | (|RxStateData) | RxStateIdle & ~Transmitting))
    LatchedMRxErr <=#Tp 1'b1;
  else
    LatchedMRxErr <=#Tp 1'b0;
end
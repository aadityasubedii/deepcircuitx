always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    LatchedCrcError <=#Tp 1'b0;
  else
  if(RxStateSFD)
    LatchedCrcError <=#Tp 1'b0;
  else
  if(RxStateData[0])
    LatchedCrcError <=#Tp RxCrcError & ~RxByteCntEq0;
end
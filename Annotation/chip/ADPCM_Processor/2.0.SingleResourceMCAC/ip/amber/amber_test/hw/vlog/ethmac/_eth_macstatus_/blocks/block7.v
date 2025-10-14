always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    DribbleNibble <=#Tp 1'b0;
  else
  if(RxStateSFD)
    DribbleNibble <=#Tp 1'b0;
  else
  if(~MRxDV & RxStateData[1])
    DribbleNibble <=#Tp 1'b1;
end
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    LatchedRxLength[15:0] <=#Tp 16'h0;
  else
  if(LoadRxStatus)
    LatchedRxLength[15:0] <=#Tp RxLength[15:0];
end
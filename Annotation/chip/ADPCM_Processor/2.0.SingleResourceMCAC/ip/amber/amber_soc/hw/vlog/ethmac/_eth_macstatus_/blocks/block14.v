always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    LoadRxStatus <=#Tp 1'b0;
  else
    LoadRxStatus <=#Tp TakeSample;
end
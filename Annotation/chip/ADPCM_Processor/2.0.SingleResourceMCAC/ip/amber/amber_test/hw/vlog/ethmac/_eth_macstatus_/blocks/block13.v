always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    ReceiveEnd  <=#Tp 1'b0;
  else
    ReceiveEnd  <=#Tp LoadRxStatus;                     
end
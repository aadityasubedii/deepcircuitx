always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxAbortSyncb2 <=#Tp 1'b0;
  else
    RxAbortSyncb2 <=#Tp RxAbortSyncb1;
end
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    RxAbortSyncb1 <=#Tp 1'b0;
  else
    RxAbortSyncb1 <=#Tp RxAbortSync2;
end
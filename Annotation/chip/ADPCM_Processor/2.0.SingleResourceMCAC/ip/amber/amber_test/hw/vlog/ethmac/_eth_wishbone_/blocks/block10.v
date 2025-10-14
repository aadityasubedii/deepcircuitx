always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxStatusWriteLatched_sync1 <=#Tp 1'b0;
      RxStatusWriteLatched_sync2 <=#Tp 1'b0;
    end
  else
    begin
      RxStatusWriteLatched_sync1 <=#Tp RxStatusWriteLatched;
      RxStatusWriteLatched_sync2 <=#Tp RxStatusWriteLatched_sync1;
    end
end
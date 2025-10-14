always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    begin
      RxStatusWriteLatched_syncb1 <=#Tp 1'b0;
      RxStatusWriteLatched_syncb2 <=#Tp 1'b0;
    end
  else
    begin
      RxStatusWriteLatched_syncb1 <=#Tp RxStatusWriteLatched_sync2;
      RxStatusWriteLatched_syncb2 <=#Tp RxStatusWriteLatched_syncb1;
    end
end
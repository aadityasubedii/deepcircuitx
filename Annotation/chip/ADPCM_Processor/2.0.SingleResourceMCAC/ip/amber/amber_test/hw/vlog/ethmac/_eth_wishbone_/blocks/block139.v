always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    BlockingTxStatusWrite_sync1 <=#Tp 1'b0;
  else
    BlockingTxStatusWrite_sync1 <=#Tp BlockingTxStatusWrite;
end
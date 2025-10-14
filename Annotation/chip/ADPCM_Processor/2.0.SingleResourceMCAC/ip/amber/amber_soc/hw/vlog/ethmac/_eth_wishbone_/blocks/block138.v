always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    BlockingTxStatusWrite_sync3 <=#Tp 1'b0;
  else
    BlockingTxStatusWrite_sync3 <=#Tp BlockingTxStatusWrite_sync2;
end
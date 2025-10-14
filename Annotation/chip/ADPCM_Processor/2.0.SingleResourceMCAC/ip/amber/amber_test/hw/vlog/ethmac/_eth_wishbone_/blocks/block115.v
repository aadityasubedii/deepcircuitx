always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxStartFrm_sync2 <=#Tp 1'b0;
  else
    TxStartFrm_sync2 <=#Tp TxStartFrm_sync1;
end
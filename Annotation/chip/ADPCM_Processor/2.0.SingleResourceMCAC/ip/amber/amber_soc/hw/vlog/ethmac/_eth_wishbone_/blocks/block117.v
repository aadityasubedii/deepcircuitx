always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxStartFrm_sync1 <=#Tp 1'b0;
  else
    TxStartFrm_sync1 <=#Tp TxStartFrm_wb;
end
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    LastWord <=#Tp 1'b0;
  else
  if((TxEndFrm | TxAbort | TxRetry) & Flop)
    LastWord <=#Tp 1'b0;
  else
  if(TxUsedData & Flop & TxByteCnt == 2'h3)
    LastWord <=#Tp TxEndFrm_wb;
end
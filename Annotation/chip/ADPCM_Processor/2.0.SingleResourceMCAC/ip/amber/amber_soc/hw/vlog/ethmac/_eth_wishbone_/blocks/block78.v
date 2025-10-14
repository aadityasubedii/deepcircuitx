always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    ReadTxDataFromFifo_tck <=#Tp 1'b0;
  else
  if(TxStartFrm_sync2 & ~TxStartFrm | TxUsedData & Flop & TxByteCnt == 2'h3 & ~LastWord | TxStartFrm & TxUsedData & Flop & TxByteCnt == 2'h0)
     ReadTxDataFromFifo_tck <=#Tp 1'b1;
  else
  if(ReadTxDataFromFifo_syncb2 & ~ReadTxDataFromFifo_syncb3)
    ReadTxDataFromFifo_tck <=#Tp 1'b0;
end
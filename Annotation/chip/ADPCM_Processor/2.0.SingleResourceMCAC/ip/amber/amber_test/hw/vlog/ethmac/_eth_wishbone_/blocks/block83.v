always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxDataLatched[31:0] <=#Tp 32'h0;
  else
 if(TxStartFrm_sync2 & ~TxStartFrm | TxUsedData & Flop & TxByteCnt == 2'h3 | TxStartFrm & TxUsedData & Flop & TxByteCnt == 2'h0)
    TxDataLatched[31:0] <=#Tp TxData_wb[31:0];
end
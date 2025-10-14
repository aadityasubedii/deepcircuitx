always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxByteCnt <=#Tp 2'h0;
  else
  if(TxAbort_q | TxRetry_q)
    TxByteCnt <=#Tp 2'h0;
  else
  if(TxStartFrm & ~TxUsedData)
    case(TxPointerLSB)  
      2'h0 : TxByteCnt <=#Tp 2'h1;
      2'h1 : TxByteCnt <=#Tp 2'h2;
      2'h2 : TxByteCnt <=#Tp 2'h3;
      2'h3 : TxByteCnt <=#Tp 2'h0;
    endcase
  else
  if(TxUsedData & Flop)
    TxByteCnt <=#Tp TxByteCnt + 1'b1;
end
always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxEndFrm <=#Tp 1'b0;
  else
  if(Flop & TxEndFrm | TxAbort | TxRetry_q)
    TxEndFrm <=#Tp 1'b0;        
  else
  if(Flop & LastWord)
    begin
      case (TxValidBytesLatched)  
        1 : TxEndFrm <=#Tp TxByteCnt == 2'h0;
        2 : TxEndFrm <=#Tp TxByteCnt == 2'h1;
        3 : TxEndFrm <=#Tp TxByteCnt == 2'h2;
        0 : TxEndFrm <=#Tp TxByteCnt == 2'h3;
        default : TxEndFrm <=#Tp 1'b0;
      endcase
    end
end
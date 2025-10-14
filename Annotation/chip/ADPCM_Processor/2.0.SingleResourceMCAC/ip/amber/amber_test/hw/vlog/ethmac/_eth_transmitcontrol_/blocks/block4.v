always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    ByteCnt <= #Tp 6'h0;
  else
  if(ResetByteCnt)
    ByteCnt <= #Tp 6'h0;
  else
  if(IncrementByteCntBy2 & EnableCnt)
    ByteCnt <= #Tp (ByteCnt[5:0] ) + 2'h2;
  else
  if(IncrementByteCnt & EnableCnt)
    ByteCnt <= #Tp (ByteCnt[5:0] ) + 1'b1;
end
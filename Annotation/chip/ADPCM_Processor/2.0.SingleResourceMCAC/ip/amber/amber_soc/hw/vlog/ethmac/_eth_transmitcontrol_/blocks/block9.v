always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    DlyCrcCnt <= #Tp 4'h0;
  else
  if(ResetByteCnt)
    DlyCrcCnt <= #Tp 4'h0;
  else
  if(IncrementDlyCrcCnt)
    DlyCrcCnt <= #Tp DlyCrcCnt + 1'b1;
end
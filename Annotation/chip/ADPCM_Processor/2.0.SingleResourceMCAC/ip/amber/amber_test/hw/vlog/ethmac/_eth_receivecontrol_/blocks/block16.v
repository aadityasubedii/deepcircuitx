always @ (posedge MRxClk or posedge RxReset)
begin
  if(RxReset)
    DlyCrcCnt <= #Tp 3'h0;
  else
  if(RxValid & RxEndFrm)
    DlyCrcCnt <= #Tp 3'h0;
  else
  if(RxValid & ~RxEndFrm & ~DlyCrcCnt[2])
    DlyCrcCnt <= #Tp DlyCrcCnt + 1'b1;
end
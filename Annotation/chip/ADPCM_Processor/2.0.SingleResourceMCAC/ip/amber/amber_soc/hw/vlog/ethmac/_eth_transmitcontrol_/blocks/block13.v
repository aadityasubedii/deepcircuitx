always @ (posedge MTxClk or posedge TxReset)
begin
  if(TxReset)
    TxUsedDataIn_q <= #Tp 1'b0;
  else
    TxUsedDataIn_q <= #Tp TxUsedDataIn;
end
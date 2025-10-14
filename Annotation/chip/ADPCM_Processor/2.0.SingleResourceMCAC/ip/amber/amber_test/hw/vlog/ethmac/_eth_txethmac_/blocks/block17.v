always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    TxUsedData <= #Tp 1'b0;
  else
    TxUsedData <= #Tp |StartData;
end
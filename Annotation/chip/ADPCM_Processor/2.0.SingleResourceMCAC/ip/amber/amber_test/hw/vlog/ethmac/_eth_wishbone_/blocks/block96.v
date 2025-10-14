always @ (posedge MTxClk or posedge Reset)
begin
  if(Reset)
    begin
      TxAbort_q      <=#Tp 1'b0;
      TxRetry_q      <=#Tp 1'b0;
      TxUsedData_q   <=#Tp 1'b0;
    end
  else
    begin
      TxAbort_q      <=#Tp TxAbort;
      TxRetry_q      <=#Tp TxRetry;
      TxUsedData_q   <=#Tp TxUsedData;
    end
end
always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    begin
      TxDone_wb_q   <=#Tp 1'b0;
      TxAbort_wb_q  <=#Tp 1'b0;
      TxRetry_wb_q  <=#Tp 1'b0;
    end
  else
    begin
      TxDone_wb_q   <=#Tp TxDone_wb;
      TxAbort_wb_q  <=#Tp TxAbort_wb;
      TxRetry_wb_q  <=#Tp TxRetry_wb;
    end
end
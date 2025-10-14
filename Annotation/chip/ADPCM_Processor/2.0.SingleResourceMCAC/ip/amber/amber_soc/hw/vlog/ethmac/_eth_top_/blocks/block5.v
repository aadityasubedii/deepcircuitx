always @ (posedge mtx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    TPauseRq <= #Tp 1'b0;
  else
    TPauseRq <= #Tp TxPauseRq_sync2 & (~TxPauseRq_sync3);
end
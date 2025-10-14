always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    RstTxPauseRq <= 1'b0;
  else
    RstTxPauseRq <=#Tp WillSendControlFrame_sync2 & ~WillSendControlFrame_sync3;
end
always @ (posedge mtx_clk_pad_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      TxPauseRq_sync1 <= #Tp 1'b0;
      TxPauseRq_sync2 <= #Tp 1'b0;
      TxPauseRq_sync3 <= #Tp 1'b0;
    end
  else
    begin
      TxPauseRq_sync1 <= #Tp (r_TxPauseRq & r_TxFlow);
      TxPauseRq_sync2 <= #Tp TxPauseRq_sync1;
      TxPauseRq_sync3 <= #Tp TxPauseRq_sync2;
    end
end
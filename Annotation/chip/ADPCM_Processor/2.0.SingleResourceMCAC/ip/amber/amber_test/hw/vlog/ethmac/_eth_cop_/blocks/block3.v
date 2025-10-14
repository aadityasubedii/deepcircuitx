always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    cnt <=#Tp 0;
  else
  if(s1_wb_ack_i | s1_wb_err_i | s2_wb_ack_i | s2_wb_err_i)
    cnt <=#Tp 0;
  else
  if(s1_wb_cyc_o | s2_wb_cyc_o)
    cnt <=#Tp cnt+1;
end
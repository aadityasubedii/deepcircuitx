always @ (posedge clk_i)
begin
  if (dcount_rst)
      rd_data_counts <= #TCQ 'b0;
  else if (mcb_rd_en_o)
      rd_data_counts <= #TCQ rd_data_counts + DWIDTH/8;

end
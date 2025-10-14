always @ (posedge clk_i)
begin
  if (dcount_rst)
      wr_data_counts <= #TCQ 'b0;
  else if (mcb_wr_en)
      wr_data_counts <= #TCQ wr_data_counts + DWIDTH/8;

end
  always @(posedge clk)
  if (rst)
    q_entry_r <= #TCQ ID[BM_CNT_WIDTH-1:0];
  else
    q_entry_r <= #TCQ q_entry_ns;
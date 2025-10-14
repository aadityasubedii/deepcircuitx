  always @(posedge clk)
    if (rst)
      wr_victim_inc <= #TCQ 1'b0;
    else if (complex_row0_wr_done && (stg1_wr_rd_cnt == 9'd2) && ~stg1_wr_done)
      wr_victim_inc <= #TCQ 1'b1;
    else
      wr_victim_inc <= #TCQ 1'b0;

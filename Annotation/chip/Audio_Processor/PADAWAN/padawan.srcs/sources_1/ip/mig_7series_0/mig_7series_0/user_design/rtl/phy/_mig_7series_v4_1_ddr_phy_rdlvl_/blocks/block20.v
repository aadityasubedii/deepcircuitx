  always @(posedge clk)
    if (rst)
      samp_edge_cnt1_r <= #TCQ 'b0;
    else
      if (!samp_edge_cnt0_en_r)
        samp_edge_cnt1_r <= #TCQ 'b0;
      else if (samp_edge_cnt1_en_r)
        samp_edge_cnt1_r <= #TCQ samp_edge_cnt1_r + 1;

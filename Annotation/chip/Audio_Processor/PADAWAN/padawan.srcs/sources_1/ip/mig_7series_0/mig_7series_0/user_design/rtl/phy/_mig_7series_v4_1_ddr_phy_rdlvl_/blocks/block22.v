  always @(posedge clk)
    if (rst)
      samp_edge_cnt0_r <= #TCQ 'b0;
    else begin
      if (!samp_edge_cnt0_en_r)
        
        samp_edge_cnt0_r <= #TCQ 'b0;
      else if (sr_valid_r2 || mpr_valid_r2)
        
        samp_edge_cnt0_r <= #TCQ samp_edge_cnt0_r + 1;
    end
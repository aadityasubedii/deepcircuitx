  always @(posedge clk)
    if (rst)
      samp_edge_cnt1_en_r <= #TCQ 1'b0;
    else begin
      
      if ((samp_edge_cnt0_r == DETECT_EDGE_SAMPLE_CNT0) &&
          (sr_valid_r2 || mpr_valid_r2))
        samp_edge_cnt1_en_r <= #TCQ 1'b1;
      else
        samp_edge_cnt1_en_r <= #TCQ 1'b0;
    end

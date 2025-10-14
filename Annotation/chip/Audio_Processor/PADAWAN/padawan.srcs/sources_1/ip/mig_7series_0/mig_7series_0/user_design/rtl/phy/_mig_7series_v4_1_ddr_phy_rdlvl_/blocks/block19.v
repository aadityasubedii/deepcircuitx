  always @(posedge clk)
    if (rst)
      samp_cnt_done_r <= #TCQ 1'b0;
    else begin
      if (!samp_edge_cnt0_en_r)
        samp_cnt_done_r <= #TCQ 'b0;
      else if ((SIM_CAL_OPTION == "FAST_CAL") ||
               (SIM_CAL_OPTION == "FAST_WIN_DETECT")) begin
        if (samp_edge_cnt0_r == SR_VALID_DELAY-1)
          
          
          samp_cnt_done_r <= #TCQ 1'b1;
      end else begin
        if (samp_edge_cnt1_r == DETECT_EDGE_SAMPLE_CNT1)
          samp_cnt_done_r <= #TCQ 1'b1;
      end
    end

      always @(posedge clk) begin
        if (rst |
            (mpr_rd_rise0_prev_r & ~mpr_rd_fall0_prev_r &
             mpr_rd_rise1_prev_r & ~mpr_rd_fall1_prev_r))
          inhibit_edge_detect_r <= 1'b1;
        else if ((cal1_state_r == CAL1_MPR_PAT_DETECT) &
                 (idelay_tap_cnt_r[rnk_cnt_r][cal1_cnt_cpt_timing] > 5'd1) &
                 (~mpr_rd_rise0_prev_r & mpr_rd_fall0_prev_r &
                  ~mpr_rd_rise1_prev_r & mpr_rd_fall1_prev_r))
          inhibit_edge_detect_r <= 1'b0;
      end
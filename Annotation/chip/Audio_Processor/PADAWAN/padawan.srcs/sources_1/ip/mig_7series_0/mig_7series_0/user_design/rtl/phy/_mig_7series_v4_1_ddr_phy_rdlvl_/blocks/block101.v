      always @(posedge clk) begin
         if (rst | (cal1_state_r == CAL1_MPR_NEW_DQS_WAIT) |
            (mpr_rd_rise0_prev_r != mux_rd_rise0_r[0]) |
            (mpr_rd_fall0_prev_r != mux_rd_fall0_r[0]) |
            (mpr_rd_rise1_prev_r != mux_rd_rise1_r[0]) |
            (mpr_rd_fall1_prev_r != mux_rd_fall1_r[0]))
           stable_idel_cnt <= #TCQ 3'd0;
         else if ((idelay_tap_cnt_r[rnk_cnt_r][cal1_cnt_cpt_timing] > 5'd0) &
                  ((cal1_state_r == CAL1_MPR_PAT_DETECT) &
                  (idel_pat_detect_valid_r))) begin
           if ((mpr_rd_rise0_prev_r == mux_rd_rise0_r[0]) &
               (mpr_rd_fall0_prev_r == mux_rd_fall0_r[0]) &
               (mpr_rd_rise1_prev_r == mux_rd_rise1_r[0]) &
               (mpr_rd_fall1_prev_r == mux_rd_fall1_r[0]) &
               (stable_idel_cnt < 3'd2))
             stable_idel_cnt <= #TCQ stable_idel_cnt + 1;
         end
      end
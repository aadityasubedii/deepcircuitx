   always @(posedge clk) begin
      if (rst | (cal1_state_r == CAL1_NEW_DQS_PREWAIT) |
         
         (mpr_rd_rise0_prev_r != mux_rd_rise0_r[0]) |
         (mpr_rd_fall0_prev_r != mux_rd_fall0_r[0]) |
         (mpr_rd_rise1_prev_r != mux_rd_rise1_r[0]) |
         (mpr_rd_fall1_prev_r != mux_rd_fall1_r[0]) |
         (mpr_rd_rise2_prev_r != mux_rd_rise2_r[0]) |
         (mpr_rd_fall2_prev_r != mux_rd_fall2_r[0]) |
         (mpr_rd_rise3_prev_r != mux_rd_rise3_r[0]) |
         (mpr_rd_fall3_prev_r != mux_rd_fall3_r[0]))
        stable_idel_cnt <= #TCQ 3'd0;
      else if ((|idelay_tap_cnt_r[rnk_cnt_r][cal1_cnt_cpt_timing]) &
               ((cal1_state_r == CAL1_MPR_PAT_DETECT) &
               (idel_pat_detect_valid_r))) begin
        if ((mpr_rd_rise0_prev_r == mux_rd_rise0_r[0]) &
            (mpr_rd_fall0_prev_r == mux_rd_fall0_r[0]) &
            (mpr_rd_rise1_prev_r == mux_rd_rise1_r[0]) &
            (mpr_rd_fall1_prev_r == mux_rd_fall1_r[0]) &
            (mpr_rd_rise2_prev_r == mux_rd_rise2_r[0]) &
            (mpr_rd_fall2_prev_r == mux_rd_fall2_r[0]) &
            (mpr_rd_rise3_prev_r == mux_rd_rise3_r[0]) &
            (mpr_rd_fall3_prev_r == mux_rd_fall3_r[0]) &
            (stable_idel_cnt < 3'd2))
          stable_idel_cnt <= #TCQ stable_idel_cnt + 1;
      end
   end
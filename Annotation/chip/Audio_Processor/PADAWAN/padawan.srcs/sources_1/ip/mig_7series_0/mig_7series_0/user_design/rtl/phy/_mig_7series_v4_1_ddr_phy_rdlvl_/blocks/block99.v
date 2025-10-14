      always @(posedge clk)begin
        if (rst | (cal1_state_r == CAL1_MPR_NEW_DQS_WAIT) |
            inhibit_edge_detect_r)
          idel_mpr_pat_detect_r     <= #TCQ 1'b0;
        
        else if ((mpr_rd_rise0_prev_r & ~mpr_rd_fall0_prev_r &
                  mpr_rd_rise1_prev_r & ~mpr_rd_fall1_prev_r) ||
                 ((stable_idel_cnt < 3'd2) & (cal1_state_r == CAL1_MPR_PAT_DETECT)
                 & (idel_pat_detect_valid_r)))
                 
          idel_mpr_pat_detect_r     <= #TCQ 1'b0;
        
        else if ((~mpr_rd_rise0_prev_r & mpr_rd_fall0_prev_r &
                  ~mpr_rd_rise1_prev_r & mpr_rd_fall1_prev_r) &
                  (stable_idel_cnt == 3'd2) &
                  ((mpr_rd_rise0_prev_r != mux_rd_rise0_r[0]) ||
                   (mpr_rd_fall0_prev_r != mux_rd_fall0_r[0]) ||
                   (mpr_rd_rise1_prev_r != mux_rd_rise1_r[0]) ||
                   (mpr_rd_fall1_prev_r != mux_rd_fall1_r[0])))
          idel_mpr_pat_detect_r     <= #TCQ 1'b1;
      end
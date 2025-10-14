   always @(posedge clk)begin
     if ((cal1_state_r == CAL1_MPR_NEW_DQS_WAIT) ||
        ((cal1_state_r == CAL1_MPR_PAT_DETECT) && (idel_pat_detect_valid_r)))begin
       mpr_rd_rise0_prev_r <= #TCQ mux_rd_rise0_r[0];
       mpr_rd_fall0_prev_r <= #TCQ mux_rd_fall0_r[0];
       mpr_rd_rise1_prev_r <= #TCQ mux_rd_rise1_r[0];
       mpr_rd_fall1_prev_r <= #TCQ mux_rd_fall1_r[0];
       mpr_rd_rise2_prev_r <= #TCQ mux_rd_rise2_r[0];
       mpr_rd_fall2_prev_r <= #TCQ mux_rd_fall2_r[0];
       mpr_rd_rise3_prev_r <= #TCQ mux_rd_rise3_r[0];
       mpr_rd_fall3_prev_r <= #TCQ mux_rd_fall3_r[0];
     end
   end
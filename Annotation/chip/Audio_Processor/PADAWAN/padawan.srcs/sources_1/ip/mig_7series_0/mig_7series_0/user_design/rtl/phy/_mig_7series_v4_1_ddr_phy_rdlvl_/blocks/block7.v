  always @(posedge clk)
    if (rst || new_cnt_cpt_r ||
       (cal1_state_r1 == CAL1_DQ_IDEL_TAP_INC) ||
       (mpr_rdlvl_done_r1 && ~mpr_rdlvl_done_r2))
      tap_limit_cpt_r <= #TCQ 1'b0;
    else if (tap_cnt_cpt_r == 6'd63)
      tap_limit_cpt_r <= #TCQ 1'b1;

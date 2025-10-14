  always @(posedge clk)
    if (init_state_r == INIT_IDLE) 
      ddr2_refresh_flag_r<= #TCQ 'b0;
    else if ((init_state_r == INIT_REFRESH) && (~mem_init_done_r)) 
      
      ddr2_refresh_flag_r<= #TCQ 1'b1;
    else if ((ddr2_refresh_flag_r) &&
             (init_state_r == INIT_LOAD_MR_WAIT)&&
             (cnt_cmd_done_r) && (cnt_init_mr_done_r))
      ddr2_refresh_flag_r <= #TCQ 'b0;
   
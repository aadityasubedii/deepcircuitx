  always @(posedge clk)
    if (rst)
      rnk_ref_cnt <= #TCQ 1'b0;
    else if (stg1_wr_done && 
            (init_state_r == INIT_REFRESH_WAIT) && cnt_cmd_done_r)
      rnk_ref_cnt <= #TCQ ~rnk_ref_cnt;
  
  always @ (posedge clk)
    err_chk_invalid <= #TCQ (wait_state_cnt_r < 'd14);
   
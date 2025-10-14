  always @(posedge clk) begin
    if (rst)
      ocal_act_wait_cnt <= #TCQ 'd0;
    else if ((init_state_r == INIT_OCAL_CENTER_ACT_WAIT) && ocal_act_wait_cnt < 'd15)
      ocal_act_wait_cnt <= #TCQ ocal_act_wait_cnt + 1;
    else
      ocal_act_wait_cnt <= #TCQ 'd0;
  end
  always @(posedge clk) begin
    if (rst)
      detect_pi_found_dqs <= #TCQ 1'b0;
    else if ((cnt_cmd_r == 7'b0111111) &&
             (init_state_r == INIT_RDLVL_STG2_READ_WAIT))
      detect_pi_found_dqs <= #TCQ 1'b1;
    else
      detect_pi_found_dqs <= #TCQ 1'b0;
  end 
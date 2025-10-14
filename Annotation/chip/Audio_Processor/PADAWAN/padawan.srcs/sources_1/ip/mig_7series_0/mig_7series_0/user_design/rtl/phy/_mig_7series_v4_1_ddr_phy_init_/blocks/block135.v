  always @(posedge clk) begin
    if (rst || pi_calib_done_r1)
      read_calib_int <= #TCQ 1'b0;
    else if (~pi_calib_done_r1 && (init_state_r == INIT_RDLVL_ACT_WAIT) &&
            (cnt_cmd_r == CNTNEXT_CMD))
      read_calib_int <= #TCQ 1'b1;
  end
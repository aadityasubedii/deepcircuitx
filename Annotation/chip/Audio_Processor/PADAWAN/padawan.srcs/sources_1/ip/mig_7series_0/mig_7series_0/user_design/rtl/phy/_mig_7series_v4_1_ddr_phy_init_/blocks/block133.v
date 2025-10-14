  always @(posedge clk) begin
    if (rst || pi_calib_done_r1)
      read_calib <= #TCQ 1'b0;
    else if (~pi_calib_done_r1 && (init_state_r == INIT_PI_PHASELOCK_READS))
      read_calib <= #TCQ 1'b1;
  end
  always @(posedge clk)
    calib_tap_inc_done_r1 <= #TCQ calib_tap_inc_done;
  
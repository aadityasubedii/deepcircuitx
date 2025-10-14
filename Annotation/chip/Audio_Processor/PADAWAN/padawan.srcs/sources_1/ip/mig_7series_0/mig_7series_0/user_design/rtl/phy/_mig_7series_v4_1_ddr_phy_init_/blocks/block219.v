  always @(posedge clk)
    if (rst)
	  calib_tap_inc_start <= #TCQ 1'b0;
	else if (init_state_r == INIT_SKIP_CALIB_WAIT)
	  calib_tap_inc_start <= #TCQ 1'b1;
	  
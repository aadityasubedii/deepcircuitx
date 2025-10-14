  always @ (posedge clk)
    calib_complete_r <= #TCQ calib_complete;
	
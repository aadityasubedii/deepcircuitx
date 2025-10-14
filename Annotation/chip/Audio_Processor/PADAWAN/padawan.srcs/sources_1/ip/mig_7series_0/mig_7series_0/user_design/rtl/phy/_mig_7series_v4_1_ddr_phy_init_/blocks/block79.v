  always @(posedge clk) begin
	complex_oclkdelay_calib_start_r1 <= #TCQ complex_oclkdelay_calib_start_int;
    complex_oclkdelay_calib_start_r2 <= #TCQ complex_oclkdelay_calib_start_r1;
  end
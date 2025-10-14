  always @ (posedge clk) begin
    if (rst)
	  sample_en_cnt <= #TCQ 'd0;
	else if ((tempmon_sample_en & ~tempmon_sample_en_101) & ((SKIP_CALIB == "TRUE")) & (sample_en_cnt < 'd5))
	  sample_en_cnt <= #TCQ sample_en_cnt + 1;
  end
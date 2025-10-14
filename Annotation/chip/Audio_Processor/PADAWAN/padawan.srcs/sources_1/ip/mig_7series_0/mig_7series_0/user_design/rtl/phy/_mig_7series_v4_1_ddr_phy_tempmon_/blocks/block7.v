  always @ (posedge clk) begin
    if (rst)
	  tempmon_done <= #TCQ 1'b0;
	else if ((sample_en_cnt == 'd5) & ((SKIP_CALIB == "TRUE")))
	  tempmon_done <= #TCQ 1'b1;
  end
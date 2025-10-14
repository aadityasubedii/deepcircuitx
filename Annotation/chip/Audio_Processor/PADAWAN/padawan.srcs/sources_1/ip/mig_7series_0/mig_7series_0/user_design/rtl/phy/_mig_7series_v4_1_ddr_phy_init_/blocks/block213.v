  always @(posedge clk) begin
    if (rst)
	  ocal_last_byte_done <= #TCQ 1'b0;
	else if ((complex_oclkdelay_calib_cnt == DQS_WIDTH-1) && oclkdelay_center_calib_done)
	  ocal_last_byte_done <= #TCQ 1'b1;
  end
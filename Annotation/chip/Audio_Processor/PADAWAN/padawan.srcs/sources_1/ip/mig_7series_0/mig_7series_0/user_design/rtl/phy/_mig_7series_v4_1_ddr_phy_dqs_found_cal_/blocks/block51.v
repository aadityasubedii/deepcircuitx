  always @(posedge clk) begin
    if (rst || (detect_rd_cnt == 'd0))
	  detect_rd_cnt <= #TCQ NUM_READS;
	else if (detect_pi_found_dqs && (detect_rd_cnt > 'd0))
	  detect_rd_cnt <= #TCQ detect_rd_cnt - 1;
  end
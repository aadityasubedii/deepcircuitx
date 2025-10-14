      always @(posedge clk) begin
	if (rst) periodic_rd_r_cnt <= #TCQ 1'b0;
	else if (periodic_rd_r_lcl && periodic_rd_ack_r)
	   periodic_rd_r_cnt <= ~periodic_rd_r_cnt;
      end
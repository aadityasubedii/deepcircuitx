   always @(posedge clk) begin
     rst_dqs_find_r1 <= #TCQ rst_dqs_find;
	 rst_dqs_find_r2 <= #TCQ rst_dqs_find_r1;
   end
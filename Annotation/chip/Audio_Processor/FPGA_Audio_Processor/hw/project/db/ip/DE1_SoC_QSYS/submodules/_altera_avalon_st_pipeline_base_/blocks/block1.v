	always @(posedge clk or posedge reset) begin
	   if (reset) begin
	      data1 <= 'b0;
	      full1 <= 1'b0;
	   end
	   else begin
	      if (in_ready) begin
		 data1 <= in_data;
		 full1 <= in_valid;
	      end
	   end
	end		
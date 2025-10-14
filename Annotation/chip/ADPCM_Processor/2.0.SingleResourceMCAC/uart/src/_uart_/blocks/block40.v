always @( posedge reset, posedge clk ) begin
	if (reset) begin
		wb_start_read_d1 <= 'd0;
	end else begin
		wb_start_read_d1 <= wb_start_read;
	end
end
always @( posedge reset, posedge clk_inv) begin
	if (reset) begin
		read_done <= 1'b1;
	end else begin
		if (i_wb_stb & i_wb_cyc) begin
			read_done <= 1'b0;
		end else begin
			read_done <= 1'b1;
		end
	end
end
always @(posedge reset, posedge clk) begin
	if (reset) begin
		full_out_r		<= 'd0;
		full_carry_out_r	<= 'd0;
		use_quick_r		<= 1'b1;
	end else begin
		full_out_r       <= full_out;
		full_carry_out_r <= full_carry_out;
		use_quick_r      <= !o_stall;
	end
end
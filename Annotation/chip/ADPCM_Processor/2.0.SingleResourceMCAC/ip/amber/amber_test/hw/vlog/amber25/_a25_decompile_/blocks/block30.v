always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		execute_valid = 'd0;
	end else if ( !i_core_stall ) begin
		execute_valid <= i_instruction_valid;
	end
end
always @( posedge reset, posedge clk ) begin
	if (reset) begin
		execute_address <= 'd0;
		execute_instruction <= 'd0;
		execute_now <= 'd0;
		execute_undefined <= 'd0;
	end else begin
		if ( !i_core_stall && i_instruction_valid ) begin
			execute_instruction <= i_instruction;
			execute_address     <= i_instruction_address;
			execute_undefined   <= i_instruction_undefined;
			execute_now         <= 1'd1;
		end else begin
			execute_now         <= 1'd0;
		end
	end
end
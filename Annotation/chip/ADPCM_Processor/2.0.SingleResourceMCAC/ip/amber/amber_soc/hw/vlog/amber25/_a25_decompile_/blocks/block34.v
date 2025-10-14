always @( posedge i_clk ) begin
	if ( !i_core_stall && i_instruction_valid ) begin
		execute_instruction <= i_instruction;
		execute_address     <= i_instruction_address;
		execute_undefined   <= i_instruction_undefined;
		execute_now         <= 1'd1;
	end else begin
		execute_now         <= 1'd0;
	end
end
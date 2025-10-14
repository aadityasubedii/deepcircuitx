always @ ( posedge i_clk ) begin
	if ( !i_core_stall ) begin
		execute_valid <= i_instruction_valid;
	end
end
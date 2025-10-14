always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		miss_address <= 'd0;
	end else if ( c_state == CS_IDLE ) begin
		miss_address <= i_address;
	end
end
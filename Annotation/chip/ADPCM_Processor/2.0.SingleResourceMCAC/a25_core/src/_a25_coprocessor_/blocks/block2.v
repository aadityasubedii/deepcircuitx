always @( posedge reset, posedge clk ) begin
	if (reset) begin
		copro_operation_d1  <= 'd0;
		copro_crn_d1        <= 'd0;
	end else begin
	    if ( !i_core_stall )
		  begin
		  copro_operation_d1  <= i_copro_operation;
		  copro_crn_d1        <= i_copro_crn;
		  end
	end
end
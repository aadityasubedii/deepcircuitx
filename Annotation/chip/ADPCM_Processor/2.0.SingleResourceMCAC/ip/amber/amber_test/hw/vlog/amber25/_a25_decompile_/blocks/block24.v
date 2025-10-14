always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		xINSTRUCTION_EXECUTE_R <= "---   ";
	end else begin
		xINSTRUCTION_EXECUTE_R <= xINSTRUCTION_EXECUTE;
	end
end
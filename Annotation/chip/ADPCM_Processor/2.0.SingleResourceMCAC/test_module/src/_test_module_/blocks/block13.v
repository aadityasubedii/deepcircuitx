always @( posedge reset, posedge clk ) begin
	if (reset) begin
		sim_ctrl_reg <= 3'b000;
	end else begin
		
		sim_ctrl_reg <= 3'd `AMBER_SIM_CTRL ;
	end
end
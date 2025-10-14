	always @ ( posedge clk or  posedge reset)
		if (reset == 1'b1) pfdena_reg <= {1{1'b1}};
		else if  (wire_pfdena_reg_ena == 1'b1)   pfdena_reg <= writedata[1];
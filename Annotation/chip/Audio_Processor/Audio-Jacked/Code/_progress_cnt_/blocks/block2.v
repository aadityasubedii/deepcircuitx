	always @ (posedge clk) begin
		if (rst) begin
			count <= 0;
			div_clk <= 0;
		end
		else if (menu == 2'b01 || menu == 2'b10) begin
			if (count == 0) begin
				count <= 50000000;
				div_clk <= ~div_clk;
			end 
			else count <= count - 1;
		end
		else begin
			count <= 0;
			div_clk <= 0;
		end
	end
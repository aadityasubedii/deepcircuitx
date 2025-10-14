	always @(posedge mclk)begin
		if(cnt256_n == 8'd0)begin
			tdmo_buf <= {ch1_in, 16'd0, ch2_in, 16'd0};
		end
		else if(cnt256_n[1:0] == 2'd0)begin
			tdmo_buf <= {tdmo_buf[62:0], 1'd0};
		end
		else begin
			
		end
	end
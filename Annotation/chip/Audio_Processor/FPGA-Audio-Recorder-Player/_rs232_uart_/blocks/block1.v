	always @(posedge clk)
	begin
		if(reset) begin
			baud_count <= 0;
			en_16_x_baud <= 0;
		end else begin
			if(baud_count == MAX_BAUD_COUNT) begin
				baud_count <= 0;
				en_16_x_baud <= 1;
			end else begin
				baud_count <= baud_count + 1;
				en_16_x_baud <= 0;
			end
		end
	end
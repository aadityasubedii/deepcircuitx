always@ (posedge serial_clk_inv, posedge reset) begin
	if (reset) begin
		next_ch0_bit <= 3'b000;		
		next_bit <= 3'b000;
		next_ch <= 5'b00000;
		ch0_grey_count <= 3'b001;	
		grey_counter <= 3'b000;
	end else begin
		if (frame_sync_in) begin	
			
			next_ch0_bit[0] <= ch0_grey_count[0] ^ ch0_grey_count[1];	
			next_ch0_bit[1] <= ch0_grey_count[1] ^ ch0_grey_count[2];
			next_ch0_bit[2] <= ch0_grey_count[2];

			ch0_grey_count <= ch0_grey_count + 3'b001;	

			next_ch <= 5'b00001;	
			next_bit <= 3'b000;
			grey_counter <= 3'b001;
		end else begin

			next_bit[0] <= grey_counter[0] ^ grey_counter[1];	
			next_bit[1] <= grey_counter[1] ^ grey_counter[2];
			next_bit[2] <= grey_counter[2];

			grey_counter <= grey_counter + 3'b001;	

			ch0_grey_count <= 3'b001;	

			if (next_bit == 3'b100) begin
				next_ch <= next_ch + 5'b00001; 
			end
		end
	end
end
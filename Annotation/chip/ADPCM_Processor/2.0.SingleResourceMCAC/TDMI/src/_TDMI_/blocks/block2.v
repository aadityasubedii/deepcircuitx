always@ (posedge serial_clk, posedge reset) begin
	if (reset) begin						
		ch_count		<= 5'b00000;
		bit_count		<= 3'b111;			
		prev_frame_sync 	<= 1'b0;
		data_out_buf 	<= 8'h00;
		fs_start		<= 1'b0;
	end else begin
		if (tdmi_begin) begin
			if ((~prev_frame_sync) & frame_sync) begin	
				ch_count <= 5'b00000;			
				data_out_buf[7] <= data_in;		
				bit_count <= 3'b110;			
				fs_start <= 1'b1;
			end else begin
				data_out_buf[bit_count] <= data_in;	
				bit_count <= bit_count - 3'b001;	
				if (bit_count == 3'b111) begin	
					ch_count <= ch_count + 5'b00001;	
				end
			end
			prev_frame_sync <= frame_sync;		
		end
	end
end
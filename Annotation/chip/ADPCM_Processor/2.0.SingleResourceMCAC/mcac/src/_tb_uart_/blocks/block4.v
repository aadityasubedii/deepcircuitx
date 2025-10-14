always @( posedge reset, posedge clk_uart) begin
	if (reset) begin
		rx_bit_count <= 4'h0;
	end else if (rx_bit_count == 4'h9) begin
		rx_bit_count <= 4'h0;
		
	end else if (rx_start_negedge) begin
		rx_bit_count <= 4'h0;
	end else begin
		rx_bit_count <= rx_bit_count + 1'd1;
	end
end
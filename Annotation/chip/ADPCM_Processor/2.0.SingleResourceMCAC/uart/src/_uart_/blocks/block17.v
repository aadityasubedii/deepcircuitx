always @( posedge reset, posedge clk ) begin
	if (reset) begin
		rx_bit_pulse_count <= 'd0;
	end else begin
	    if ( restart_rx_bit_count )
		  rx_bit_pulse_count <= 'd0;
	    else
		  rx_bit_pulse_count <= rx_bit_pulse_count + 1'd1;
	end
end
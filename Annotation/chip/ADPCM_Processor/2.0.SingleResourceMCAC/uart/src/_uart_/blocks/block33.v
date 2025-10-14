always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		rx_interrupt <= 'd0;
	end else begin
	    if (fifo_enable)
		  rx_interrupt <=  rx_fifo_half_or_more || rx_int_timer == RX_INTERRUPT_COUNT;
	    else    
		  rx_interrupt <=  rx_fifo_full;
	end
end
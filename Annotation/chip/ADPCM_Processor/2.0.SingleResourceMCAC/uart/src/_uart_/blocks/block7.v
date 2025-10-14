always @ ( posedge reset, posedge clk ) begin
	if (reset) begin

	end else begin
	    uart0_rx_int_d1 <= rx_interrupt;

	    if ( rx_interrupt && !uart0_rx_int_d1 )
		  begin
		  `TB_DEBUG_MESSAGE
		  $display("rx_interrupt Interrupt fifo_enable %d, rx_fifo_full %d", 
		           fifo_enable, rx_fifo_full);
		  $display("rx_fifo_half_or_more %d, rx_int_timer 0x%08h, rx_fifo_count %d", 
		           rx_fifo_half_or_more, rx_int_timer, rx_fifo_count);
		  end
		  
	    if ( !rx_interrupt && uart0_rx_int_d1 )
		  begin
		  `TB_DEBUG_MESSAGE
		  $display("rx_interrupt Interrupt Cleared fifo_enable %d, rx_fifo_full %d", 
		           fifo_enable, rx_fifo_full);
		  $display("    rx_fifo_half_or_more %d, rx_int_timer 0x%08h, rx_fifo_count %d", 
		           rx_fifo_half_or_more, rx_int_timer, rx_fifo_count);
		  end
	end
end
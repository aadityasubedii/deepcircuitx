always @ ( posedge reset, posedge clk ) begin
	if (reset) begin

	end else begin
	    if ( rx_fifo_pop  && !rx_fifo_push && rx_fifo_empty )
		  begin
		  `TB_WARNING_MESSAGE
		  $write("UART rx FIFO underflow\n");
		  end
	    if ( !rx_fifo_pop  && rx_fifo_push && rx_fifo_full )
		  begin
		  `TB_WARNING_MESSAGE
		  $write("UART rx FIFO overflow\n");
		  end

	    if ( tx_fifo_push && tx_fifo_full )
		  begin
		  `TB_WARNING_MESSAGE
		  $display("UART tx FIFO overflow - char = %c", wb_wdata32[7:0]);
		  end
	end
end
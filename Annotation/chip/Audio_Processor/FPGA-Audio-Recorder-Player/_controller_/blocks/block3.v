rs232_uart urt(
		.tx_data_in(pb_out_port), 
		.write_tx_data(write_to_uart), 
		.tx_buffer_full(uart_buffer_full),
		.rx_data_out(uart_rx_data),
		.read_rx_data_ack(read_from_uart),
		.rx_data_present(uart_data_present),
		.rs232_tx(rs232_tx),
		.rs232_rx(rs232_rx),
		.reset(uart_reset),
		.clk(clk100mhz)
);	
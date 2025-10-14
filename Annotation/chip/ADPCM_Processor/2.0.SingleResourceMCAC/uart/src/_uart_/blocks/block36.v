assign rx_fifo_pop           = wb_start_read && i_wb_adr[15:0] == AMBER_UART_DR;
assign rx_fifo_push_not_full = rx_fifo_push && !rx_fifo_full;
assign rx_fifo_pop_not_empty = rx_fifo_pop && !rx_fifo_empty;
assign rx_fifo_half_or_more  = rx_fifo_count >= 5'd8;
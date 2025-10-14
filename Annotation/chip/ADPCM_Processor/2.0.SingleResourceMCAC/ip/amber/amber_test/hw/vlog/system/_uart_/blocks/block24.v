assign   tx_fifo_push               = wb_start_write && i_wb_adr[15:0] == AMBER_UART_DR;
assign   tx_fifo_push_not_full      = tx_fifo_push && !tx_fifo_full;
assign   tx_fifo_pop_not_empty      = txd_state == TXD_STOP3 && tx_bit_pulse == 1'd1 && !tx_fifo_empty;
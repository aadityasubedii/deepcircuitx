assign   o_uart_txd                 = txd;

assign   tx_fifo_full               = fifo_enable ? tx_fifo_count >= 5'd16 :  tx_fifo_full_flag;
assign   tx_fifo_empty              = fifo_enable ? tx_fifo_count == 5'd00 : !tx_fifo_full_flag;
assign   tx_fifo_half_or_less_full  =               tx_fifo_count <= 5'd8;
assign   tx_byte                    = fifo_enable ? tx_fifo[tx_fifo_rp[3:0]] : tx_fifo[0] ;

assign   tx_fifo_push               = wb_start_write && i_wb_adr[15:0] == AMBER_UART_DR;
assign   tx_fifo_push_not_full      = tx_fifo_push && !tx_fifo_full;
assign   tx_fifo_pop_not_empty      = txd_state == TXD_STOP3 && tx_bit_pulse == 1'd1 && !tx_fifo_empty;

assign   o_uart_txd                 = txd;

assign   tx_fifo_full               = fifo_enable ? tx_fifo_count >= 5'd16 :  tx_fifo_full_flag;
assign   tx_fifo_empty              = fifo_enable ? tx_fifo_count == 5'd00 : !tx_fifo_full_flag;
assign   tx_fifo_half_or_less_full  =               tx_fifo_count <= 5'd8;
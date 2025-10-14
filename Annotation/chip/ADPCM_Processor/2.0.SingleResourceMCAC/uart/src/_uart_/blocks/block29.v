assign   tx_fifo_full               = fifo_enable ? tx_fifo_count >= 5'd16 :  tx_fifo_full_flag;
assign   tx_fifo_empty              = fifo_enable ? tx_fifo_count == 5'd00 : !tx_fifo_full_flag;
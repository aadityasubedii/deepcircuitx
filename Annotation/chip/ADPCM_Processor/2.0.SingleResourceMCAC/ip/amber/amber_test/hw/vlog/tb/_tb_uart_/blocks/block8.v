assign tx_bit_start = tx_bit_count == 4'd0;      
assign txfifo_empty = txfifo_wp == txfifo_rp;
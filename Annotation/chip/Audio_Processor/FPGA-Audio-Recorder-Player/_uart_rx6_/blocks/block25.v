(* HBLKNM = "uart_rx6_4" *)
FD buffer_write_flop(  
        .D      (buffer_write_value),
        .Q      (buffer_write),
        .C      (clk));
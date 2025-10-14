(* HBLKNM = "uart_rx6_4" *)
FD stop_bit_flop(  
        .D      (stop_bit_value),
        .Q      (stop_bit),
        .C      (clk));
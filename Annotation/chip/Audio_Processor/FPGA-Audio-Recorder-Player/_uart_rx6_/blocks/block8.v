(* HBLKNM = "uart_rx6_4" *)
FD start_bit_flop(  
        .D      (start_bit_value),
        .Q      (start_bit),
        .C      (clk));
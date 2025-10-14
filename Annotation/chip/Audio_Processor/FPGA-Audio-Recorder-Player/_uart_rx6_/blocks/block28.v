(* HBLKNM = "uart_rx6_4" *)
FD sample_flop(  
        .D      (sample_value),
        .Q      (sample),
        .C      (clk));
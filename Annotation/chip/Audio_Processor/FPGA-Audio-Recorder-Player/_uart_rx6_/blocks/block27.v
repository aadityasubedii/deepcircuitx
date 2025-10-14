(* HBLKNM = "uart_rx6_4" *)
FD sample_dly_flop(  
        .D      (sample_dly_value),
        .Q      (sample_dly),
        .C      (clk));
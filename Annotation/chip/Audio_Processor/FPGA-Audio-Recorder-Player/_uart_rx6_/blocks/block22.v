(* HBLKNM = "uart_rx6_2" *)
FD data0_flop(  
        .D      (data_value[0]),
        .Q      (data[0]),
        .C      (clk));
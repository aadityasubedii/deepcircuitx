(* HBLKNM = "uart_rx6_1" *)
FDR pointer2_flop(  
        .D      (pointer_value[2]),
        .Q      (pointer[2]),
        .R      (buffer_reset),
        .C      (clk));
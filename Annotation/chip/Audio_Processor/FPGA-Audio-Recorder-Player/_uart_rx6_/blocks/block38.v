(* HBLKNM = "uart_rx6_1" *)
FDR pointer3_flop(  
        .D      (pointer_value[3]),
        .Q      (pointer[3]),
        .R      (buffer_reset),
        .C      (clk));
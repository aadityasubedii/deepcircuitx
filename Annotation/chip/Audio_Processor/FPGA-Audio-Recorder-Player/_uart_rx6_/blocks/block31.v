(* HBLKNM = "uart_rx6_1" *)
FDR data_present_flop(  
        .D      (data_present_value),
        .Q      (data_present_int),
        .R      (buffer_reset),
        .C      (clk));
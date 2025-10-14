        
(* HBLKNM = "uart_rx6_3" *)
LUT6_2 #(
        .INIT    (64'h6CCC00005AAA0000))
div23_lut( 
        .I0     (div[2]),
        .I1     (div[3]),
        .I2     (div_carry),
        .I3     (en_16_x_baud),
        .I4     (run),
        .I5     (1'b1),
        .O5     (div_value[2]),
        .O6     (div_value[3])); 
        
(* HBLKNM = "uart_rx6_3" *)
FD div2_flop(  
        .D      (div_value[2]),
        .Q      (div[2]),
        .C      (clk));
        
(* HBLKNM = "uart_rx6_3" *)
FD div3_flop(  
        .D      (div_value[3]),
        .Q      (div[3]),
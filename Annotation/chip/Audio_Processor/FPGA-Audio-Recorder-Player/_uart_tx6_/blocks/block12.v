(* HBLKNM = "uart_tx6_2" *)
LUT6 #(
        .INIT    (64'h85500000AAAAAAAA))
sm0_lut( 
        .I0     (sm[0]),
        .I1     (sm[1]),
        .I2     (sm[2]),
        .I3     (sm[3]),
        .I4     (data_present_int),
        .I5     (next_bit),
        .O      (sm_value[0])); 
        
(* HBLKNM = "uart_tx6_2" *)
FD sm0_flop(  
        .D      (sm_value[0]),
        .Q      (sm[0]),
        .C      (clk));                   
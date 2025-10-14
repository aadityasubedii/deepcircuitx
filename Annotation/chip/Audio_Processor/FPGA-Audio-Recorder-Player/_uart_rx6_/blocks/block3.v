        
(* HBLKNM = "uart_rx6_3" *)
LUT6_2 #(
        .INIT    (64'h0080000088888888))
sample_input_lut( 
        .I0     (div[0]),
        .I1     (div[1]),
        .I2     (div[2]),
        .I3     (div[3]),
        .I4     (en_16_x_baud),
        .I5     (1'b1),
        .O5     (div_carry),
        .O6     (sample_input_value)); 
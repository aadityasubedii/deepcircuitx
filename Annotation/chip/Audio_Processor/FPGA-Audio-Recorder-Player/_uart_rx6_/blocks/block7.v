(* HBLKNM = "uart_rx6_3" *)
LUT6_2 #(
        .INIT    (64'h6C0000005A000000))
div01_lut( 
        .I0     (div[0]),
        .I1     (div[1]),
        .I2     (en_16_x_baud),
        .I3     (run),
        .I4     (1'b1),
        .I5     (1'b1),
        .O5     (div_value[0]),
        .O6     (div_value[1])); 
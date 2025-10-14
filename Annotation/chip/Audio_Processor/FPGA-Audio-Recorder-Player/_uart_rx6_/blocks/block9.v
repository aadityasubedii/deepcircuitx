(* HBLKNM = "uart_rx6_4" *)
LUT6 #(
        .INIT    (64'h222200F000000000))
start_bit_lut( 
        .I0     (start_bit),
        .I1     (sample_input),
        .I2     (sample_dly),
        .I3     (sample),
        .I4     (run),
        .I5     (1'b1),
        .O      (start_bit_value)); 
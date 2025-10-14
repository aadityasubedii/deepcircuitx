(* HBLKNM = "uart_rx6_4" *)
LUT6_2 #(
        .INIT    (64'hCCF00000AACC0000))
sample_lut( 
        .I0     (serial_in),
        .I1     (sample),
        .I2     (sample_dly),
        .I3     (en_16_x_baud),
        .I4     (1'b1),
        .I5     (1'b1),
        .O5     (sample_value),
        .O6     (sample_dly_value)); 
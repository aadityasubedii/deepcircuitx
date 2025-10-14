(* HBLKNM = "uart_rx6_4" *)
LUT6_2 #(
        .INIT    (64'hCAFFCAFF0000C0C0))
stop_bit_lut( 
        .I0     (stop_bit),
        .I1     (sample),
        .I2     (sample_input),
        .I3     (run),
        .I4     (data[0]),
        .I5     (1'b1),
        .O5     (buffer_write_value),
        .O6     (stop_bit_value)); 
(* HBLKNM = "uart_rx6_4" *)
LUT6 #(
        .INIT    (64'h2F2FAFAF0000FF00))
run_lut( 
        .I0     (data[0]),
        .I1     (start_bit),
        .I2     (sample_input),
        .I3     (sample_dly),
        .I4     (sample),
        .I5     (run),
        .O      (run_value)); 
(* HBLKNM = "uart_rx6_2" *)
LUT6_2 #(
        .INIT    (64'hF0CCFFFFCCAAFFFF))
data67_lut( 
        .I0     (data[6]),
        .I1     (data[7]),
        .I2     (stop_bit),
        .I3     (sample_input),
        .I4     (run),
        .I5     (1'b1),
        .O5     (data_value[6]),
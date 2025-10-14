(* HBLKNM = "uart_rx6_2" *)
LUT6_2 #(
        .INIT    (64'hF0CCFFFFCCAAFFFF))
data45_lut( 
        .I0     (data[4]),
        .I1     (data[5]),
        .I2     (data[6]),
        .I3     (sample_input),
        .I4     (run),
        .I5     (1'b1),
        .O5     (data_value[4]),
        .O6     (data_value[5])); 
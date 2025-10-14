(* HBLKNM = "uart_rx6_2" *)
LUT6_2 #(
        .INIT    (64'hF0CCFFFFCCAAFFFF))
data23_lut( 
        .I0     (data[2]),
        .I1     (data[3]),
        .I2     (data[4]),
        .I3     (sample_input),
        .I4     (run),
        .I5     (1'b1),
        .O5     (data_value[2]),
        .O6     (data_value[3])); 
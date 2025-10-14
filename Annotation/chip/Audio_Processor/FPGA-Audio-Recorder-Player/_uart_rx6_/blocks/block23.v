(* HBLKNM = "uart_rx6_2" *)
LUT6_2 #(
        .INIT    (64'hF0CCFFFFCCAAFFFF))
data01_lut( 
        .I0     (data[0]),
        .I1     (data[1]),
        .I2     (data[2]),
        .I3     (sample_input),
        .I4     (run),
        .I5     (1'b1),
        .O5     (data_value[0]),
        .O6     (data_value[1])); 
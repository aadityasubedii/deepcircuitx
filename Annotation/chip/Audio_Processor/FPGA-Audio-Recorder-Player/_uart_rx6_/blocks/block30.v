(* HBLKNM = "uart_rx6_3" *)
LUT6_2 #(
        .INIT    (64'h0001000080000000))
full_lut( 
        .I0     (pointer[0]),
        .I1     (pointer[1]),
        .I2     (pointer[2]),
        .I3     (pointer[3]),
        .I4     (1'b1),
        .I5     (1'b1),
        .O5     (full_int),
        .O6     (zero)); 
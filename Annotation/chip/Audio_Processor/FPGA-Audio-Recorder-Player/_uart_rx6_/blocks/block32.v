(* HBLKNM = "uart_rx6_1" *)
LUT6_2 #(
        .INIT    (64'hF4FCF4FC040004C0))
data_present_lut( 
        .I0     (zero),
        .I1     (data_present_int),
        .I2     (buffer_write),
        .I3     (buffer_read),
        .I4     (full_int),
        .I5     (1'b1),
        .O5     (en_pointer),
        .O6     (data_present_value)); 
(* HBLKNM = "uart_tx6_3" *)
LUT6_2 #(
	.INIT    (64'h0000000080000000))
next_lut( 
	.I0     (div[0]),
	.I1     (div[1]),
	.I2     (div[2]),
	.I3     (div[3]),
	.I4     (en_16_x_baud),
	.I5     (last_bit),
	.O5     (next_value),
	.O6     (buffer_read_value));                     
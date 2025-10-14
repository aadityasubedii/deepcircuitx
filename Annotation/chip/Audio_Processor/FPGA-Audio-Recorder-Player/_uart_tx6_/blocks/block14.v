(* HBLKNM = "uart_tx6_4" *)
LUT6_2 #(
	.INIT    (64'hCFAACC0F0FFFFFFF))
serial_lut( 
	.I0     (lsb_data),
	.I1     (msb_data),
	.I2     (sm[1]),
	.I3     (sm[2]),
	.I4     (sm[3]),
	.I5     (1'b1),
	.O5     (last_bit),
	.O6     (serial_data));                     

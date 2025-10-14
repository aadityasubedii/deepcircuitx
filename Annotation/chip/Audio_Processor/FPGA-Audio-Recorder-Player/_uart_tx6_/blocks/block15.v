(* HBLKNM = "uart_tx6_4" *)
LUT6 #(
	.INIT    (64'hFF00F0F0CCCCAAAA))
msb_data_lut( 
	.I0     (data[4]),
	.I1     (data[5]),
	.I2     (data[6]),
	.I3     (data[7]),
	.I4     (sm[0]),
	.I5     (sm[1]),
	.O      (msb_data)); 
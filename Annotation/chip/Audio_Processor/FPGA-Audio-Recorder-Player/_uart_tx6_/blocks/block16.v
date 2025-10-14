(* HBLKNM = "uart_tx6_4" *)
LUT6 #(
	.INIT    (64'hFF00F0F0CCCCAAAA))
lsb_data_lut( 
	.I0     (data[0]),
	.I1     (data[1]),
	.I2     (data[2]),
	.I3     (data[3]),
	.I4     (sm[0]),
	.I5     (sm[1]),
	.O      (lsb_data)); 
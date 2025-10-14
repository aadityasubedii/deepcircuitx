(* HBLKNM = "uart_tx6_3" *)
LUT6_2 #(
	.INIT    (64'h7F80FF007878F0F0))
div23_lut( 
	.I0     (div[0]),
	.I1     (div[1]),
	.I2     (div[2]),
	.I3     (div[3]),
	.I4     (en_16_x_baud),
	.I5     (1'b1),
	.O5     (div_value[2]),
	.O6     (div_value[3]));                     

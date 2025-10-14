(* HBLKNM = "uart_tx6_1" *)
LUT6_2 #(
	.INIT    (64'hCC9060CCAA5050AA))
pointer01_lut( 
	.I0     (pointer[0]),
	.I1     (pointer[1]),
	.I2     (en_pointer),
	.I3     (buffer_write),
	.I4     (buffer_read),
	.I5     (1'b1),
	.O5     (pointer_value[0]),
	.O6     (pointer_value[1])); 
	
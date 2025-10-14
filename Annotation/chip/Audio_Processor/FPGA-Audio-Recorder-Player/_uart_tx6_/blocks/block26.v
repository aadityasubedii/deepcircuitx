(* HBLKNM = "uart_tx6_1" *)
LUT6 #(
	.INIT    (64'hFF00FE00FF80FF00))
pointer3_lut( 
	.I0     (pointer[0]),
	.I1     (pointer[1]),
	.I2     (pointer[2]),
	.I3     (pointer[3]),
	.I4     (buffer_write),
	.I5     (buffer_read),
	.O      (pointer_value[3]));                      
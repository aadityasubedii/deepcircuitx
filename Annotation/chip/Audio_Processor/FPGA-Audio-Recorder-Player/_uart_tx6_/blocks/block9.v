(* HBLKNM = "uart_tx6_2" *)
LUT6 #(
	.INIT    (64'h87440000FF00FF00))
sm3_lut( 
	.I0     (sm[0]),
	.I1     (sm[1]),
	.I2     (sm[2]),
	.I3     (sm[3]),
	.I4     (data_present_int),
	.I5     (next_bit),
	.O      (sm_value[3])); 
	
(* HBLKNM = "uart_tx6_2" *)
FD sm3_flop(  
	.D 	(sm_value[3]),
	.Q 	(sm[3]),
	.C 	(clk)); 
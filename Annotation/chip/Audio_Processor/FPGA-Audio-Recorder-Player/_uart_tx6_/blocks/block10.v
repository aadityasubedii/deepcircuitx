(* HBLKNM = "uart_tx6_2" *)
LUT6 #(
	.INIT    (64'h88700000F0F0F0F0))
sm2_lut( 
	.I0     (sm[0]),
	.I1     (sm[1]),
	.I2     (sm[2]),
	.I3     (sm[3]),
	.I4     (data_present_int),
	.I5     (next_bit),
	.O      (sm_value[2])); 
	
(* HBLKNM = "uart_tx6_2" *)
FD sm2_flop(  
	.D 	(sm_value[2]),
	.Q 	(sm[2]),
	.C 	(clk)); 
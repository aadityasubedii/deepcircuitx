(* HBLKNM = "uart_tx6_2" *)
LUT6 #(
	.INIT    (64'h26610000CCCCCCCC))
sm1_lut( 
	.I0     (sm[0]),
	.I1     (sm[1]),
	.I2     (sm[2]),
	.I3     (sm[3]),
	.I4     (data_present_int),
	.I5     (next_bit),
	.O      (sm_value[1])); 
	
(* HBLKNM = "uart_tx6_2" *)
FD sm1_flop(  
	.D 	(sm_value[1]),
	.Q 	(sm[1]),
	.C 	(clk)); 
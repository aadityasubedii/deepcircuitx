(* HBLKNM = "uart_tx6_3" *)
FD div2_flop(  
	.D 	(div_value[2]),
	.Q 	(div[2]),
	.C 	(clk));
	
(* HBLKNM = "uart_tx6_3" *)
FD div3_flop(  
	.D 	(div_value[3]),
	.Q 	(div[3]),
	.C 	(clk));
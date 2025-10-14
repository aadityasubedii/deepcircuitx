(* HBLKNM = "uart_tx6_3" *)
FD next_flop(  
	.D 	(next_value),
	.Q 	(next_bit),
	.C 	(clk));
	
(* HBLKNM = "uart_tx6_3" *)
FD read_flop(  
	.D 	(buffer_read_value),
	.Q 	(buffer_read),
	.C 	(clk));
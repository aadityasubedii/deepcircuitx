(* HBLKNM = "uart_tx6_4" *)
FD serial_flop(  
	.D 	(serial_data),
	.Q 	(serial_out),
	.C 	(clk));
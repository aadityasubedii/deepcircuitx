(* HBLKNM = "uart_tx6_1" *)
FDR pointer1_flop(  
	.D	(pointer_value[1]),
	.Q	(pointer[1]),
	.R	(buffer_reset),
	.C	(clk));

(* HBLKNM = "kcpsm6_stack_ram0" *)
FD stack_zero_flop(  
	.D      (stack_zero_flag),
	.Q      (shadow_zero_value),
	.C      (clk)) ;

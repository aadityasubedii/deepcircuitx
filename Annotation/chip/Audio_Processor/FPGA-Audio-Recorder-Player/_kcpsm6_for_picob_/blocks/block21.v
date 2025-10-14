if (hwbuild[i] == 1'b1) begin: high_hwbuild 



(* HBLKNM = "kcpsm6_sandr" *)
FDS shift_rotate_flop( 
	.D      (shift_rotate_value[i]),
	.Q      (shift_rotate_result[i]),
	.S 	(instruction[7]),
	.C      (clk)) ;

end 
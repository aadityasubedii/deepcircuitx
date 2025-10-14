if (hwbuild[i] == 1'b0) begin: low_hwbuild 



(* HBLKNM = "kcpsm6_sandr" *)
FDR shift_rotate_flop( 
	.D      (shift_rotate_value[i]),
	.Q      (shift_rotate_result[i]),
	.R      (instruction[7]),
	.C      (clk)) ;
           
end 
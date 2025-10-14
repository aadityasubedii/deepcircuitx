if (i > 0) begin: upper_arith_logical



(* HBLKNM = {"kcpsm6_add",id4} *)
MUXCY arith_logical_muxcy( 
	.DI 	(logical_carry_mask[i]),
	.CI 	(carry_arith_logical[i-1]),
	.S 	(half_arith_logical[i]),
	.O      (carry_arith_logical[i]));

(* HBLKNM = {"kcpsm6_add",id4} *)
XORCY arith_logical_xorcy( 
	.LI 	(half_arith_logical[i]),
	.CI 	(carry_arith_logical[i-1]),
	.O      (arith_logical_value[i]));

end 
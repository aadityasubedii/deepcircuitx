if (i == 0) begin: lsb_arith_logical



(* HBLKNM = {"kcpsm6_add",id4} *)
MUXCY arith_logical_muxcy( 
	.DI 	(logical_carry_mask[i]),
	.CI 	(arith_carry_in),
	.S 	(half_arith_logical[i]),
	.O      (carry_arith_logical[i]));

(* HBLKNM = {"kcpsm6_add",id4} *)
XORCY arith_logical_xorcy( 
	.LI 	(half_arith_logical[i]),
	.CI 	(arith_carry_in),
	.O      (arith_logical_value[i]));

end 
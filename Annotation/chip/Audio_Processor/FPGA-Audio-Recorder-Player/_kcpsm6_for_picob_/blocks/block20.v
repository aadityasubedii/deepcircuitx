if (i == 0) begin: lsb_shift_rotate



(* HBLKNM = "kcpsm6_decode1" *)
LUT6 #(
	.INIT    (64'hBFBC8F8CB3B08380))
shift_bit_lut( 
	.I0     (instruction[0]),
	.I1     (instruction[1]),
	.I2     (instruction[2]),
	.I3     (carry_flag),
	.I4     (sx[0]),
	.I5     (sx[7]),
	.O      (shift_in_bit));




(* HBLKNM = "kcpsm6_sandr" *)
LUT6_2 #(
	.INIT    (64'hFF00F0F0CCCCAAAA))
shift_rotate_lut( 
	.I0     (shift_in_bit),
	.I1     (sx[i+1]),
	.I2     (sx[i]),
	.I3     (sx[i+2]),
	.I4     (instruction[3]),
	.I5     (1'b1),
	.O5     (shift_rotate_value[i]),
	.O6     (shift_rotate_value[i+1]));

end 
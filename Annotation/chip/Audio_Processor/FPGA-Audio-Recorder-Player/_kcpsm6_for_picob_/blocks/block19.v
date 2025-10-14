if (i == 2 || i == 4) begin: mid_shift_rotate



(* HBLKNM = "kcpsm6_sandr" *)
LUT6_2 #(
	.INIT    (64'hFF00F0F0CCCCAAAA))
shift_rotate_lut( 
	.I0     (sx[i-1]),
	.I1     (sx[i+1]),
	.I2     (sx[i]),
	.I3     (sx[i+2]),
	.I4     (instruction[3]),
	.I5     (1'b1),
	.O5     (shift_rotate_value[i]),
	.O6     (shift_rotate_value[i+1]));

end 
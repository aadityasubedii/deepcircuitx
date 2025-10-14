if (i % 2 == 0) begin: output_data

(* HBLKNM = "kcpsm6_port_id" *)
LUT6_2 #(
	.INIT    (64'hFF00F0F0CCCCAAAA))
sy_kk_mux_lut( 
	.I0     (sy[i]),
	.I1     (instruction[i]),
	.I2     (sy[i+1]),
	.I3     (instruction[i+1]),
	.I4     (instruction[12]),
	.I5     (1'b1),
	.O5     (sy_or_kk[i]),
	.O6     (sy_or_kk[i+1]));

end 
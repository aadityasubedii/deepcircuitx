if (i % 2 == 0) begin: second_operand

(* HBLKNM = "kcpsm6_out_port" *)
LUT6_2 #(
	.INIT    (64'hFF00F0F0CCCCAAAA))
out_port_lut( 
	.I0     (sx[i]),
	.I1     (instruction[i+4]),
	.I2     (sx[i+1]),
	.I3     (instruction[i+5]),
	.I4     (instruction[13]),
	.I5     (1'b1),
	.O5     (out_port[i]),
	.O6     (out_port[i+1]));

end 
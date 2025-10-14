assign lsl_out[0] = 	p_l[31] & lsl_mask[31];


assign lsl_out[1] = 	shift_nzero ?	p_l[0] & lsl_mask[32]:
					i_carry_in;
assign lsr_out[0] = 	p_r[31] & lsr_mask[31];


assign lsr_out[1] = i_shift_imm_zero ?	i_in[31] :
			shift_nzero ?	p_r[31] & lsr_mask[32]:
					i_carry_in;
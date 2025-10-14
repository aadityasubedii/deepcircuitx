assign ror_out[0] = i_shift_imm_zero ?	i_carry_in :
					p_r[31];


assign ror_out[1] = i_shift_imm_zero ?	i_in[0] :
			shift_nzero ?	p_r[31] :
					i_carry_in;
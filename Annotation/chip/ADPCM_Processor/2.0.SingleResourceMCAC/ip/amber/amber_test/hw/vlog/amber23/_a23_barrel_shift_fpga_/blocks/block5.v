assign asr_out[0] = 	i_in[31] ?	i_in[31] :
					p_r[31] & lsr_mask[31] ;


assign asr_out[1] =	shift_over ?	i_in[31] :
			shift_nzero ?	p_r[31] :
					i_carry_in;
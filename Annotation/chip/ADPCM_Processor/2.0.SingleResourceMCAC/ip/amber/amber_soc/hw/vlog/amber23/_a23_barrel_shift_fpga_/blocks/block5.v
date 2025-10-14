assign asr_out[1] =	shift_over ?	i_in[31] :
			shift_nzero ?	p_r[31] :
					i_carry_in;
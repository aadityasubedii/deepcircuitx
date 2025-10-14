assign o_out[30:0] =	(p_l[30:0] & lsl_mask[30:0]) |
			(p_r[30:0] & lsr_mask[30:0]) |
			(~lsr_mask[30:0] & {31{asr_sign}});

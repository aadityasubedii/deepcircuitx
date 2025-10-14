			always @*
				out[j] = in[j] & (~shift_amount[i] ^ direction) |
					 in[wrap(j, i)] & (shift_amount[i] ^ direction);
		end
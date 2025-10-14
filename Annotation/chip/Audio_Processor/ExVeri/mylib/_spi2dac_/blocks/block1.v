			assign dac_sck = !clk_1MHz&!dac_cs;
			assign dac_sdi = shift_reg[15];
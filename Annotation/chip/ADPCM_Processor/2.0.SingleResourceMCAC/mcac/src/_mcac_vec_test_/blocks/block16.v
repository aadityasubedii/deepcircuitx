assign dec_i_clk = (tie_in) ? (enc_i_clk) : (enc_s_clk);
assign dec_in = (tie_in) ? (enc_i) : (dec_i);
assign dec_fs_in = (tie_in) ? (enc_i_fs) : (dec_i_fs);
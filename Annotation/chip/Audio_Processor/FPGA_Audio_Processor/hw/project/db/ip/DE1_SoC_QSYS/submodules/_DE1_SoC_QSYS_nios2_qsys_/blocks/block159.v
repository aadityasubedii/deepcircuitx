  assign av_ld_byte2_data_nxt = av_ld_rshift8      ? av_ld_byte3_data :
    av_ld_extend       ? {8 {av_fill_bit}} :
    d_readdata[23 : 16];
  assign av_ld_byte1_data_nxt = av_ld_rshift8      ? av_ld_byte2_data :
    av_ld_extend       ? {8 {av_fill_bit}} :
    d_readdata[15 : 8];
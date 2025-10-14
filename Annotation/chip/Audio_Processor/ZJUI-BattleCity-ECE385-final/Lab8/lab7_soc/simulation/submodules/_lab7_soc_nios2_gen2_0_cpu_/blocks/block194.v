  assign av_ld_byte0_data_nxt = av_ld_rshift8      ? av_ld_byte1_data :
    av_ld_extend       ? av_ld_byte0_data :d_readdata[7 : 0];
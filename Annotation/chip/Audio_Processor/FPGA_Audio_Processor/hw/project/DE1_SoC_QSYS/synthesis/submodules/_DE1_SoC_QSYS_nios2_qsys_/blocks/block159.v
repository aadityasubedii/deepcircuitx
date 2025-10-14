  assign av_ld_rshift8 = av_ld_aligning_data & 
    (av_ld_align_cycle < (W_mem_baddr[1 : 0]));
  assign av_ld_aligning_data_nxt = av_ld_aligning_data ? 
    ~av_ld_align_one_more_cycle : 
    (~D_ctrl_mem32 & av_ld_getting_data);
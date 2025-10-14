  assign av_ld_waiting_for_data_nxt = av_ld_waiting_for_data ? 
    ~av_ld_getting_data : 
    (R_ctrl_ld & E_new_inst);
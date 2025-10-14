assign con_read_data_word = 
                          i_address[3:2] == 2'd0 ? data_wdata_r[ 31:  0] :
                          i_address[3:2] == 2'd1 ? data_wdata_r[ 63: 32] : 
                          i_address[3:2] == 2'd2 ? data_wdata_r[ 95: 64] : 
                                                   data_wdata_r[127: 96] ;
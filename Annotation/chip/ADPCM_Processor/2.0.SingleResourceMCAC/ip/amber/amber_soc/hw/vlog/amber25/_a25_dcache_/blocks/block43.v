assign consecutive_write_wdata = 
                          i_address[3:2] == 2'd0 ? {data_wdata_r[127:32], con_write_data_word                           } :
                          i_address[3:2] == 2'd1 ? {data_wdata_r[127:64], con_write_data_word, data_wdata_r[31:0]  } :
                          i_address[3:2] == 2'd2 ? {data_wdata_r[127:96], con_write_data_word, data_wdata_r[63:0]  } :
                                                   {                      con_write_data_word, data_wdata_r[95:0]  } ;
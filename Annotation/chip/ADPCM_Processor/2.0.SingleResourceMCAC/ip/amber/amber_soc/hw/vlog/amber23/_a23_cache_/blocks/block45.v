assign write_hit_wdata  = i_address[3:2] == 2'd0 ? {hit_rdata[127:32], write_data_word                   } :
                          i_address[3:2] == 2'd1 ? {hit_rdata[127:64], write_data_word, hit_rdata[31:0]  } :
                          i_address[3:2] == 2'd2 ? {hit_rdata[127:96], write_data_word, hit_rdata[63:0]  } :
                                                   {                   write_data_word, hit_rdata[95:0]  } ;
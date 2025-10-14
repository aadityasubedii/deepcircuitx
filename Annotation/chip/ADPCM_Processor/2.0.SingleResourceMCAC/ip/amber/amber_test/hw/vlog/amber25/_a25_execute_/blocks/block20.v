assign  exec_load_rd_nxt   = { i_decode_load_rd[7:6],
                               i_decode_load_rd[5] ? USR : status_bits_mode,  
                               i_decode_load_rd[4:0] };
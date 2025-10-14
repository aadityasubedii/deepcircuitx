      begin : status_ram



        wire [4:0] status_ram_wr_addr_ns = ram_init_done_r_lcl
                                           ? rd_buf_wr_addr
                                           : rd_buf_indx_r[4:0];
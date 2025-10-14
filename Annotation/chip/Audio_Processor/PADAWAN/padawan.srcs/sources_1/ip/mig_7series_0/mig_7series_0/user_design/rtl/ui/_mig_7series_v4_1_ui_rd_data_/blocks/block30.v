        wire [1:0] status_ram_wr_data_ns =
                         ram_init_done_r_lcl
                           ? {rd_data_end, ~(rd_data_offset
                                              ? wr_status_r1
                                              : wr_status[0])}
                           : 2'b0;
        reg [1:0] status_ram_wr_data_r;
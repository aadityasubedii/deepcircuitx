always @( posedge i_clk )
    if ( !i_mem_stall )
        begin                                                                                                             
        mem_read_data_r         <= i_mem_read_data;
        mem_read_data_valid_r   <= i_mem_read_data_valid;
        mem_load_rd_r           <= i_mem_load_rd;
        end
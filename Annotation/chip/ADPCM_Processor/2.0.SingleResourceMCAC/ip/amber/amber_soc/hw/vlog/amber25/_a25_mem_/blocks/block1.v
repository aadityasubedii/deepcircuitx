always @( posedge i_clk )
    if ( !wb_stop || o_mem_stall )
        begin
        mem_read_data_r         <= mem_read_data_c;
        mem_load_rd_r           <= mem_load_rd_c;
        mem_read_data_valid_r   <= mem_read_data_valid_c;
        end
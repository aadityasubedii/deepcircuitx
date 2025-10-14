always@(posedge i_clk)
    if ( i_cache_flush )
        read_buf_valid_r <= 1'd0;
    else if (i_wb_ready && c_state == CS_FILL3)
        begin
        read_buf_data_r  <= i_wb_read_data;
        read_buf_addr_r  <= miss_address;
        read_buf_valid_r <= 1'd1;
        end
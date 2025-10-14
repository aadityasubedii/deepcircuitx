always @( posedge i_clk )
    begin
    uncached_wb_stop_r      <= (uncached_wb_stop_r || (uncached_data_access_p&&!cache_stall)) && (i_fetch_stall || o_mem_stall);
    cached_wb_stop_r        <= (cached_wb_stop_r   || cached_wb_req)          && (i_fetch_stall || o_mem_stall);
    daddress_valid_stop_r   <= (daddress_valid_stop_r || daddress_valid_p)    && (i_fetch_stall || o_mem_stall);
    
    mem_stall_r <= o_mem_stall;
    end
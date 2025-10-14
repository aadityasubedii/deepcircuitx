always @ ( posedge i_clk )
    if ( o_wb_cached_req || write_hit )
        miss_address <= i_address;

always @ ( posedge i_clk )
    if ( i_wb_cached_ready )
        wb_rdata_burst <= i_wb_cached_rdata;

        




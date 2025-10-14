always @(posedge i_clk)
    if ( o_wb_cached_req )
        wb_address <= i_address;
    else if ( i_wb_cached_ready && fill_state )    
        wb_address <= {wb_address[31:4], wb_address[3:2] + 1'd1, 2'd0};
        
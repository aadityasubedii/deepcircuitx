always @ ( posedge i_clk )
    if ( o_wb_req )
        miss_address <= i_address;
        
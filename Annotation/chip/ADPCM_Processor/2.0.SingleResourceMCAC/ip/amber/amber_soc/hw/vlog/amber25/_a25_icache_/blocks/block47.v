always @ ( posedge i_clk )
    if ( c_state == CS_IDLE )
        miss_address <= i_address;

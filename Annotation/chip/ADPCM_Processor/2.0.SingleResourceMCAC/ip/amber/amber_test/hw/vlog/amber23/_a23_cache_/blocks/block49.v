always @ (posedge i_clk)
    if ( ex_read_hit )
        ex_read_address <= i_address[CACHE_ADDR32_MSB:CACHE_ADDR32_LSB];
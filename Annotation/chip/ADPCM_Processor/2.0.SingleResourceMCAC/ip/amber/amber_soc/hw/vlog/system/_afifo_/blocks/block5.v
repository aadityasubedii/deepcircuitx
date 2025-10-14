always @( posedge rd_clk )
    if ( i_pop && !o_empty )
        rd_pointer <= rd_pointer + 1'd1;

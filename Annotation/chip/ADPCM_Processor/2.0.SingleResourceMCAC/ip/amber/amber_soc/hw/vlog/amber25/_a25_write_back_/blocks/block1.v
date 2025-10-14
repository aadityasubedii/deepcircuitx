always @( posedge i_clk )
    if ( !i_mem_stall )
        daddress_r              <= i_daddress;

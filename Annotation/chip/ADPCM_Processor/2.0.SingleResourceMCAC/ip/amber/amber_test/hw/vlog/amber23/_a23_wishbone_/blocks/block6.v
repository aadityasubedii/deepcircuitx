always @( posedge i_clk )
    if ( start_access )
        o_wb_dat <= i_write_data;


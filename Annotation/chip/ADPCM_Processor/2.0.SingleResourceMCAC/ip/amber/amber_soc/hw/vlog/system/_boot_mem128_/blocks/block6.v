`ifdef AMBER_WISHBONE_DEBUG
    assign o_wb_ack    = i_wb_stb && ( start_write || start_read_r[jitter_r[1]] );
`else
    assign o_wb_ack    = i_wb_stb && ( start_write || start_read_r );
`endif
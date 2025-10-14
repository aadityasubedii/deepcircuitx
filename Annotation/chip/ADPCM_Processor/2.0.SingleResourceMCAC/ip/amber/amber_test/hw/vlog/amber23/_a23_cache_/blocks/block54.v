always @ ( posedge i_clk )
    if ( !i_wb_stall )
        wb_rdata_burst <= {i_wb_read_data, wb_rdata_burst[127:32]};

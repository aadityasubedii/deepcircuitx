always @( posedge i_clk )
    if ( wb_wait && !wbuf_busy_r && (core_write_request || cache_write_request) )
        begin
        wbuf_addr_r <= i_address;
        wbuf_sel_r  <= i_byte_enable;
        wbuf_busy_r <= 1'd1;
        end
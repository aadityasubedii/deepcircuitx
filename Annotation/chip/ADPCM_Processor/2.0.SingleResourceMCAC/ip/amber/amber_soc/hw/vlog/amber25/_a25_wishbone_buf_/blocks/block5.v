always @(posedge i_clk)
    if (push)
        begin
        wbuf_wdata_r [wbuf_wp_r]   <= i_wdata;
        wbuf_addr_r  [wbuf_wp_r]   <= i_addr;
        wbuf_be_r    [wbuf_wp_r]   <= i_write ? i_be : 16'hffff;
        wbuf_write_r [wbuf_wp_r]   <= i_write;
        wbuf_wp_r                  <= !wbuf_wp_r;
        end
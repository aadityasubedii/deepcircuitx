always @(posedge i_clk)
    if (pop)
        wbuf_rp_r                  <= !wbuf_rp_r;
            
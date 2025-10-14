      if (ADDR_MAP[12*m+:4] < 4'hA) begin: gen_lt10
        
        
        for (n = 0; n < 4; n = n + 1) begin: loop_xpose
          assign phy_dout[320*ADDR_MAP[(12*m+8)+:3] +
                          80*ADDR_MAP[(12*m+4)+:2] +
                          8*ADDR_MAP[12*m+:4] + n]
                   = mux_address[ROW_WIDTH*(n/PHASE_DIV) + m];
        end
  generate
    if (WE_MAP[3:0] < 4'hA) begin: gen_we_lt10
      assign phy_dout[(320*WE_MAP[10:8] + 80*WE_MAP[5:4] +
                       8*WE_MAP[3:0])+:4]
               = {mux_we_n[3/PHASE_DIV], mux_we_n[2/PHASE_DIV],
                  mux_we_n[1/PHASE_DIV], mux_we_n[0]};
    end else begin: gen_we_ge10
      assign phy_dout[(320*WE_MAP[10:8] + 80*WE_MAP[5:4] +
                       8*(WE_MAP[3:0]-5) + 4)+:4]
               = {mux_we_n[3/PHASE_DIV], mux_we_n[2/PHASE_DIV],
                  mux_we_n[1/PHASE_DIV], mux_we_n[0]};
    end
  endgenerate
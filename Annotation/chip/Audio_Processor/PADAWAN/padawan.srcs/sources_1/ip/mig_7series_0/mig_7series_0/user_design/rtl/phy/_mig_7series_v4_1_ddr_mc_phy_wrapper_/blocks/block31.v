  generate
    if (RAS_MAP[3:0] < 4'hA) begin: gen_ras_lt10
      assign phy_dout[(320*RAS_MAP[10:8] + 80*RAS_MAP[5:4] +
                       8*RAS_MAP[3:0])+:4]
               = {mux_ras_n[3/PHASE_DIV], mux_ras_n[2/PHASE_DIV],
                  mux_ras_n[1/PHASE_DIV], mux_ras_n[0]};
    end else begin: gen_ras_ge10
      assign phy_dout[(320*RAS_MAP[10:8] + 80*RAS_MAP[5:4] +
                       8*(RAS_MAP[3:0]-5) + 4)+:4]
               = {mux_ras_n[3/PHASE_DIV], mux_ras_n[2/PHASE_DIV],
                  mux_ras_n[1/PHASE_DIV], mux_ras_n[0]};
    end
  endgenerate
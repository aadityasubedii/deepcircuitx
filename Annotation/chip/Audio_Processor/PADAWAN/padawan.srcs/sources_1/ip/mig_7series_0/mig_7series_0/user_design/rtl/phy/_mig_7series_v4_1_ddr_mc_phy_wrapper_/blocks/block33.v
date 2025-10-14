  generate
    
    if (CAS_MAP[3:0] < 4'hA) begin: gen_cas_lt10
      
      
      
      
      
      
      assign phy_dout[(320*CAS_MAP[10:8] + 80*CAS_MAP[5:4] +
                       8*CAS_MAP[3:0])+:4]
               = {mux_cas_n[3/PHASE_DIV], mux_cas_n[2/PHASE_DIV],
                  mux_cas_n[1/PHASE_DIV], mux_cas_n[0]};
    end else begin: gen_cas_ge10
      
      
      
      
      
      assign phy_dout[(320*CAS_MAP[10:8] + 80*CAS_MAP[5:4] +
                       8*(CAS_MAP[3:0]-5) + 4)+:4]
               = {mux_cas_n[3/PHASE_DIV], mux_cas_n[2/PHASE_DIV],
                  mux_cas_n[1/PHASE_DIV], mux_cas_n[0]};
    end
  endgenerate
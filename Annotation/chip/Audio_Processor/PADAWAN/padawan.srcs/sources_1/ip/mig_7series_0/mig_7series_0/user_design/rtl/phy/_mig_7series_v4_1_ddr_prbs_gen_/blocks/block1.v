  assign prbs_o = {dout_fall3, dout_rise3, dout_fall2, dout_rise2, dout_fall1, dout_rise1, dout_fall0, dout_rise0};
  
  assign dbg_prbs_gen[9] = phy_if_empty_r;
  assign dbg_prbs_gen[8] = clk_en_i;
  assign dbg_prbs_gen[7:0] = rd_addr[7:0];
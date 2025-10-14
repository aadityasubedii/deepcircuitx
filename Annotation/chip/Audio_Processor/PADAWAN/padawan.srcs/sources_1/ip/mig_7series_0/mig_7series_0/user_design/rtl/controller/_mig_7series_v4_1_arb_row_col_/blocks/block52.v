`ifdef MC_SVA
  all_bank_machines_config_arb: cover property (@(posedge clk) (~rst && &rtc));
`endif
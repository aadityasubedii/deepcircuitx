assign bram_rdy_o = run_traffic_i & cmd_clk_en & bram_valid_i | mode_load_pulse;
end
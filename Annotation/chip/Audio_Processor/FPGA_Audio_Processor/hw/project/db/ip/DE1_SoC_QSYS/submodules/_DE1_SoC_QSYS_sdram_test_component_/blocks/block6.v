  DE1_SoC_QSYS_sdram_test_component_ram_module DE1_SoC_QSYS_sdram_test_component_ram
    (
      .data      (rmw_temp),
      .q         (read_data),
      .rdaddress ((CODE == 24'h205752) ? test_addr : read_addr),
      .rdclken   (1'b1),
      .wraddress (test_addr),
      .wrclock   (clk),
      .wren      (CODE == 24'h205752)
    );
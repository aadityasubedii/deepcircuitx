lab7_soc_nios2_gen2_0_cpu_ociram_sp_ram_module lab7_soc_nios2_gen2_0_cpu_ociram_sp_ram
  (
    .address    (ociram_addr),
    .byteenable (ociram_byteenable),
    .clock      (clk),
    .data       (ociram_wr_data),
    .q          (ociram_readdata),
    .reset_req  (ociram_reset_req),
    .wren       (ociram_wr_en)
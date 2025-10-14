lab7_soc_nios2_gen2_0_cpu_register_bank_b_module lab7_soc_nios2_gen2_0_cpu_register_bank_b
  (
    .clock     (clk),
    .data      (W_rf_wr_data),
    .q         (R_rf_b_q),
    .rdaddress (D_iw_b),
    .wraddress (W_dst_regnum),
    .wren      (W_rf_wren)
  );
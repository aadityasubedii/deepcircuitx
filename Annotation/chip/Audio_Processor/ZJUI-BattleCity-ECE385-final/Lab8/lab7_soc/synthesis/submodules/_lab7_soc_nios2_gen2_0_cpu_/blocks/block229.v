  lab7_soc_nios2_gen2_0_cpu_nios2_oci_xbrk the_lab7_soc_nios2_gen2_0_cpu_nios2_oci_xbrk
    (
      .D_valid         (D_valid),
      .E_valid         (E_valid),
      .F_pc            (F_pc),
      .clk             (clk),
      .reset_n         (reset_n),
      .trigger_state_0 (trigger_state_0),
      .trigger_state_1 (trigger_state_1),
      .xbrk_break      (xbrk_break),
      .xbrk_ctrl0      (xbrk_ctrl0),
      .xbrk_ctrl1      (xbrk_ctrl1),
      .xbrk_ctrl2      (xbrk_ctrl2),
      .xbrk_ctrl3      (xbrk_ctrl3),
      .xbrk_goto0      (xbrk_goto0),
      .xbrk_goto1      (xbrk_goto1),
      .xbrk_traceoff   (xbrk_traceoff),
      .xbrk_traceon    (xbrk_traceon),
      .xbrk_trigout    (xbrk_trigout)
    );

  lab7_soc_nios2_gen2_0_cpu_nios2_oci_dbrk the_lab7_soc_nios2_gen2_0_cpu_nios2_oci_dbrk
    (
      .E_st_data                   (E_st_data),
      .av_ld_data_aligned_filtered (av_ld_data_aligned_filtered),
      .clk                         (clk),
      .cpu_d_address               (cpu_d_address),
      .cpu_d_read                  (cpu_d_read),
      .cpu_d_readdata              (cpu_d_readdata),
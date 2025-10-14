  lab7_soc_nios2_gen2_0_cpu_nios2_oci_pib the_lab7_soc_nios2_gen2_0_cpu_nios2_oci_pib
    (
      .tr_data (tr_data)
    );

  lab7_soc_nios2_gen2_0_cpu_nios2_oci_im the_lab7_soc_nios2_gen2_0_cpu_nios2_oci_im
    (
      .clk                (clk),
      .jrst_n             (jrst_n),
      .tracemem_on        (tracemem_on),
      .tracemem_trcdata   (tracemem_trcdata),
      .tracemem_tw        (tracemem_tw),
      .trc_ctrl           (trc_ctrl),
      .trc_im_addr        (trc_im_addr),
      .trc_wrap           (trc_wrap),
      .tw                 (tw),
      .xbrk_wrap_traceoff (xbrk_wrap_traceoff)
    );
  lab7_soc_nios2_gen2_0_cpu_nios2_oci_itrace the_lab7_soc_nios2_gen2_0_cpu_nios2_oci_itrace
    (
      .clk                   (clk),
      .dbrk_traceoff         (dbrk_traceoff),
      .dbrk_traceon          (dbrk_traceon),
      .itm                   (itm),
      .jdo                   (jdo),
      .jrst_n                (jrst_n),
      .take_action_tracectrl (take_action_tracectrl),
      .trc_ctrl              (trc_ctrl),
      .trc_on                (trc_on),
      .xbrk_traceoff         (xbrk_traceoff),
      .xbrk_traceon          (xbrk_traceon),
      .xbrk_wrap_traceoff    (xbrk_wrap_traceoff)
    );

  lab7_soc_nios2_gen2_0_cpu_nios2_oci_dtrace the_lab7_soc_nios2_gen2_0_cpu_nios2_oci_dtrace
    (
      .atm             (atm),
      .clk             (clk),
      .cpu_d_address   (cpu_d_address),
      .cpu_d_read      (cpu_d_read),
      .cpu_d_readdata  (cpu_d_readdata),
      .cpu_d_wait      (cpu_d_wait),
      .cpu_d_write     (cpu_d_write),
      .cpu_d_writedata (cpu_d_writedata),
      .dtm             (dtm),
      .jrst_n          (jrst_n),
      .trc_ctrl        (trc_ctrl)
    );
  assign unxcomplemented_resetxx2 = jrst_n;
  altera_std_synchronizer the_altera_std_synchronizer2
    (
      .clk (tck),
      .din (monitor_ready),
      .dout (monitor_ready_sync),
      .reset_n (unxcomplemented_resetxx2)
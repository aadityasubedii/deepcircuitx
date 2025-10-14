  altera_std_synchronizer the_altera_std_synchronizer1
    (
      .clk (tck),
      .din (debugack),
      .dout (debugack_sync),
      .reset_n (unxcomplemented_resetxx1)
    );
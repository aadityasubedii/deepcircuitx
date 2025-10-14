  lab7_soc_sdram_input_efifo_module the_lab7_soc_sdram_input_efifo_module
    (
      .almost_empty (almost_empty),
      .almost_full  (almost_full),
      .clk          (clk),
      .empty        (f_empty),
      .full         (za_waitrequest),
      .rd           (f_select),
      .rd_data      (fifo_read_data),
      .reset_n      (reset_n),
      .wr           ((~az_wr_n | ~az_rd_n) & !za_waitrequest),
      .wr_data      ({az_wr_n, az_addr, az_wr_n ? 4'b0 : az_be_n, az_data})
    );
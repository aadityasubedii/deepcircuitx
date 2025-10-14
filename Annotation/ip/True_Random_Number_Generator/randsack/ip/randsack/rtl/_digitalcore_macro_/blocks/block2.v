  assign io_oeb[5:0] = 6'b0;
  assign io_oeb[37:6] = gpio_oeb &
    {
      ~uart_enabled,
      1'b1,
      1'b1,
      1'b1,
      1'b1,
      ~ring0_test_en,
      ~ring1_test_en,
      {25{1'b1}}
    };
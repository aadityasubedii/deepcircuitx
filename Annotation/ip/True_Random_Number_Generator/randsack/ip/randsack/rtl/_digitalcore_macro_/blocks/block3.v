  assign gpio_in = io_in[37:6];
  assign uart_rx = io_in[35];

  assign io_out[5:0] = 6'b0;
  assign io_out[37:6] = gpio_out |
    {
      uart_tx & uart_enabled,
      1'b0,
      1'b0,
      1'b0,
      1'b0,
      ring0_test_out,
      ring1_test_out,
      1'b0,
      pwm_out[0],
      1'b0,
      pwm_out[1],
      1'b0,
      pwm_out[2],
      1'b0,
      pwm_out[3],
      17'b0
    };
  assign data_io_idle_pwrdwn = DATA_IO_IDLE_PWRDWN == "ON" ? idle : 1'b0;
  assign iddr_rst_i = iddr_rst;
  assign stop_strobe = writedata[3] && control_wr_strobe;
  assign start_strobe = writedata[2] && control_wr_strobe;
  assign control_continuous = control_register[1];
  assign control_interrupt_enable = control_register[0];
  assign status_wr_strobe = chipselect && ~write_n && (address == 0);
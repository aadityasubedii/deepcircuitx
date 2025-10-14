  assign do_start_counter = start_strobe;
  assign do_stop_counter = (stop_strobe                            ) ||
    (force_reload                           ) ||
    (counter_is_zero && ~control_continuous );
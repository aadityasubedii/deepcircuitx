  if (PRESENT_DATA_C) begin
      assign C_of_data_full     = C_of_full;
      assign C_of_ctl_full      = 0;
      assign C_of_data_a_full   = C_of_a_full;
      assign C_of_ctl_a_full    = 0;
      assign C_pre_data_a_full  = C_pre_fifo_a_full;
  end
  else  begin
      assign C_of_ctl_full       = C_of_full;
      assign C_of_data_full      = 0;
      assign C_of_ctl_a_full     = C_of_a_full;
      assign C_of_data_a_full    = 0;
      assign C_pre_data_a_full    = 0;
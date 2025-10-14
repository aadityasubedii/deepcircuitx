  if (PRESENT_DATA_B) begin
      assign B_of_data_full     = B_of_full;
      assign B_of_ctl_full      = 0;
      assign B_of_data_a_full   = B_of_a_full;
      assign B_of_ctl_a_full    = 0;
      assign B_pre_data_a_full  = B_pre_fifo_a_full;
  end
  else  begin
      assign B_of_ctl_full      = B_of_full;
      assign B_of_data_full     = 0;
      assign B_of_ctl_a_full    = B_of_a_full;
      assign B_of_data_a_full   = 0;
      assign B_pre_data_a_full  = 0;
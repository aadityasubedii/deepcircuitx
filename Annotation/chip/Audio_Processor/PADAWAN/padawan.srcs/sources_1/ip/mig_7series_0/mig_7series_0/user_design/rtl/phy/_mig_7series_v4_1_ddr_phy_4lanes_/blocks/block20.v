  if (PRESENT_DATA_D) begin
      assign D_of_data_full      = D_of_full;
      assign D_of_ctl_full       = 0;
      assign D_of_data_a_full    = D_of_a_full;
      assign D_of_ctl_a_full     = 0;
      assign D_pre_data_a_full   = D_pre_fifo_a_full;
  end
  else  begin
      assign D_of_ctl_full       = D_of_full;
      assign D_of_data_full      = 0;
      assign D_of_ctl_a_full     = D_of_a_full;
      assign D_of_data_a_full    = 0;
      assign D_pre_data_a_full   = 0;
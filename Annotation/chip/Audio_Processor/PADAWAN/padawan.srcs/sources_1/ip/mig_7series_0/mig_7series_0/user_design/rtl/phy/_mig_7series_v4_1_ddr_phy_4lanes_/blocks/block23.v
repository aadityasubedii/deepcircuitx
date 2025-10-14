
  if (PRESENT_DATA_A) begin
      assign A_of_data_full     = A_of_full;
      assign A_of_ctl_full      = 0;
      assign A_of_data_a_full   = A_of_a_full;
      assign A_of_ctl_a_full    = 0;
      assign A_pre_data_a_full  = A_pre_fifo_a_full;
  end
  else  begin
      assign A_of_ctl_full      = A_of_full;
      assign A_of_data_full     = 0;
      assign A_of_ctl_a_full    = A_of_a_full;
      assign A_of_data_a_full   = 0;
      assign A_pre_data_a_full  = 0;
  end
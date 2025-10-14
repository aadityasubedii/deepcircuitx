  assign cpu_d_address = d_address;
  assign cpu_d_readdata = av_ld_data_aligned_filtered;
  assign cpu_d_read = d_read;
  assign cpu_d_writedata = E_st_data;
  assign cpu_d_write = d_write;
  assign cpu_d_wait = d_waitrequest;
  assign dbrk_data = cpu_d_write ? cpu_d_writedata : cpu_d_readdata;
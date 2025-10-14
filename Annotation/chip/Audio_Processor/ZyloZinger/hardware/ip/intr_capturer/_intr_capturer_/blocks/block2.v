  assign access_lower_32 = read & (addr == 0);
  assign act_readdata = readdata_lower_intr | readdata_higher_intr;
  assign rddata = readdata_with_waitstate;
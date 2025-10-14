  assign d_out = my_empty[4] ? d_in : mem_out;
  
  assign empty_out = empty_in[0] & my_empty[0];
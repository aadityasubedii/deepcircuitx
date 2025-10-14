  assign read_temp[7 : 0] = mask[0] ? 8'bz : read_data[7 : 0];
  assign read_temp[15 : 8] = mask[1] ? 8'bz : read_data[15 : 8];
  
  assign read_addr = (index == 0)? rd_addr_pipe_0 :
    (index == 1)? rd_addr_pipe_1 :
    rd_addr_pipe_2;

  
  assign read_mask = (index == 0)? rd_mask_pipe_0 :
    (index == 1)? rd_mask_pipe_1 :
    rd_mask_pipe_2;

  
  assign read_valid = (index == 0)? rd_valid_pipe[0] :
    (index == 1)? rd_valid_pipe[1] :
    rd_valid_pipe[2];

  assign index = latency - 1'b1;
  assign mask = read_mask;
  assign zs_dq = read_valid ? read_temp : {16{1'bz}};
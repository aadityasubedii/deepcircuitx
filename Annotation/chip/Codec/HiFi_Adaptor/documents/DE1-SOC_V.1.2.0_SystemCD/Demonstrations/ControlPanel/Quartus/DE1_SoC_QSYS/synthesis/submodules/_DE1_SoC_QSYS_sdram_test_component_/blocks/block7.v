  assign read_addr = (index == 0)? rd_addr_pipe_0 :
    (index == 1)? rd_addr_pipe_1 :
    rd_addr_pipe_2;
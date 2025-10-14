  assign read_valid = (index == 0)? rd_valid_pipe[0] :
    (index == 1)? rd_valid_pipe[1] :
    rd_valid_pipe[2];
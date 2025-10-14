  assign read_mask = (index == 0)? rd_mask_pipe_0 :
    (index == 1)? rd_mask_pipe_1 :
    rd_mask_pipe_2;
  always @(posedge clk)
    begin
      
      if (cke)
        begin
          
          if (CODE == 24'h4c4d52)
              latency <= a[6 : 4];
          
          if (CODE == 24'h414354)
              addr_crb <= {ba[1], a, ba[0]};
          rd_valid_pipe[2] <= rd_valid_pipe[1];
          rd_valid_pipe[1] <= rd_valid_pipe[0];
          rd_valid_pipe[0] <= CODE == 24'h205244;
          rd_addr_pipe_2 <= rd_addr_pipe_1;
          rd_addr_pipe_1 <= rd_addr_pipe_0;
          rd_addr_pipe_0 <= test_addr;
          rd_mask_pipe_2 <= rd_mask_pipe_1;
          rd_mask_pipe_1 <= rd_mask_pipe_0;
          rd_mask_pipe_0 <= dqm;
        end
    end
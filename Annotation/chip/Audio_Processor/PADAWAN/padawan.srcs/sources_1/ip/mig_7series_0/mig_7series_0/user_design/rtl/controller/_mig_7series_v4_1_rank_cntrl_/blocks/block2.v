      always @(posedge clk) periodic_rd_request_r <=
                              #TCQ periodic_rd_request_ns;

   `ifdef MC_SVA
      read_clears_periodic_rd_request: cover property (@(posedge clk)
               (rst && (periodic_rd_request_r && read_this_rank)));
   `endif

      assign periodic_rd_request = init_calib_complete && periodic_rd_request_r;
    end else
      assign periodic_rd_request = 1'b0; 

  end
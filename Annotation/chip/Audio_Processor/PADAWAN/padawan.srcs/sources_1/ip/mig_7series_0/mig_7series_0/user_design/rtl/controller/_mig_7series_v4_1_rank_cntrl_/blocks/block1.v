      assign periodic_rd_request = init_calib_complete && periodic_rd_request_r;
    end else
      assign periodic_rd_request = 1'b0; 
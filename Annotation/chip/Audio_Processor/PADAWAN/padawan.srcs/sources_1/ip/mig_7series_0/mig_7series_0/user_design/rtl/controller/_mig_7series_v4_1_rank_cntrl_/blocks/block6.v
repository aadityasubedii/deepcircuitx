      always @(clear_periodic_rd_request or periodic_rd_cntr1_r) begin
        periodic_rd_cntr1_ns = periodic_rd_cntr1_r;
        if (clear_periodic_rd_request)
          periodic_rd_cntr1_ns = periodic_rd_cntr1_r + 1'b1;
      end
      always @(posedge clk) begin
        if (rst) periodic_rd_cntr1_r <= #TCQ 1'b0;
        else     periodic_rd_cntr1_r <= #TCQ periodic_rd_cntr1_ns;
      end
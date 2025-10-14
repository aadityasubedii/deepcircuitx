      always @(posedge clk) rmw_wait_r <= #TCQ rmw_wait_ns;
    end
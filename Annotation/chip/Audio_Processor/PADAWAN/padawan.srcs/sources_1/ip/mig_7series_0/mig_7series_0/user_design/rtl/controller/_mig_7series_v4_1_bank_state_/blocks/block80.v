      always @(posedge clk) rcd_active_r <= #TCQ rcd_active_ns;
    end
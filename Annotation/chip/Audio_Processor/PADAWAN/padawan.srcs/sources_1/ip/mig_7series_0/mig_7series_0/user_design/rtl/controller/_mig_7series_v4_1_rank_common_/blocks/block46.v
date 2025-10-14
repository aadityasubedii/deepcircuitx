        always @(posedge clk) sre_request_r <= #TCQ sre_request_ns;
        
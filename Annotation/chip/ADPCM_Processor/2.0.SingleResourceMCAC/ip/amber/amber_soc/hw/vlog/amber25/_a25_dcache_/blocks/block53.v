always @(posedge i_clk)
    request_r <= (request_pulse || request_r) && o_stall;

always @( posedge i_clk )
    begin
    uncached_wb_req_r <=  (o_wb_uncached_req || uncached_wb_req_r) && !i_wb_uncached_ready;
    end
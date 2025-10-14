always @(posedge i_clk)
    wb_req_r <= o_wb_req && !i_wb_ready;

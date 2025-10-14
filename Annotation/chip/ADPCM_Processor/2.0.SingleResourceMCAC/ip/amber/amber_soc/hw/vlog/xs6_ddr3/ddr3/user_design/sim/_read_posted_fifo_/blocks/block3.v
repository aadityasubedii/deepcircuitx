   always @ (posedge clk_i)
        empty_r <= #TCQ empty;
        
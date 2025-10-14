  always @(posedge clk)
    reset <= #TCQ (rst | rst_tg_mc);

initial
    begin
    @ (posedge i_brd_clk_p)
    brd_temp = $time;
    @ (posedge i_brd_clk_p)
    brd_clk_period = $time - brd_temp;
    pll_clk_period = brd_clk_period / 4;
    end
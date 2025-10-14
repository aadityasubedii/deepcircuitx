always @ ( posedge `U_SYSTEM.sys_clk )
    clk_count <= clk_count + 1'd1;

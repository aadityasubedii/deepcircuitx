always @(posedge phy_clk ) begin
   
    rst_primitives    <= !phy_ctl_ready ;
    A_rst_primitives  <= rst_primitives ;
    B_rst_primitives  <= rst_primitives ;
    C_rst_primitives  <= rst_primitives ;
    D_rst_primitives  <= rst_primitives ;

    rclk_delay        <= #1 (rclk_delay << 1) | (!rst_primitives && phyGo);
    mcGo              <= #1 rst_out ;

end
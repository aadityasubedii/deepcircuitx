always @(posedge phy_clk or posedge rst ) begin

    if ( rst)  begin
       rst_out   <= #1 0;
    end
    else begin
       if ( rclk_delay_11)
         rst_out <= #1 1;
    end
end
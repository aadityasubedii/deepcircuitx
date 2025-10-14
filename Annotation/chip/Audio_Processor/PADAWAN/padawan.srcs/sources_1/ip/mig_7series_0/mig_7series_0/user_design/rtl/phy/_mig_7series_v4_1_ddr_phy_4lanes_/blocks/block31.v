always @(rclk_delay[11]) begin : rclk_delay_11_blk
    if ( rclk_delay[11])
       rclk_delay_11 = 1;
    else
       rclk_delay_11 = 0;
end
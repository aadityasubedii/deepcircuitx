generate

genvar i;

if (RCLK_SELECT_LANE == "A")  begin
     assign rclk_ = A_rclk;
     assign pi_iserdes_rst = A_pi_iserdes_rst;
     end
else if (RCLK_SELECT_LANE == "B")  begin
     assign rclk_ = B_rclk;
     assign pi_iserdes_rst = B_pi_iserdes_rst;
     end
else if (RCLK_SELECT_LANE == "C") begin
     assign rclk_ = C_rclk;
     assign pi_iserdes_rst = C_pi_iserdes_rst;
     end
else if (RCLK_SELECT_LANE == "D") begin
     assign rclk_ = D_rclk;
     assign pi_iserdes_rst = D_pi_iserdes_rst;
     end
else  begin
     assign rclk_ = B_rclk; 
     end

endgenerate
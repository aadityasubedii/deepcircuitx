    always @(posedge mmcm_ps_clk) begin
      rising_clk_seen <= 1'b0;
      q1_delayed <= 1'bx;
    end
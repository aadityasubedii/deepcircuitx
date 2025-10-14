      always @(posedge clk)
        rnk_config_strobe_r[i] <= #TCQ rnk_config_strobe_r[i-1];
  endgenerate
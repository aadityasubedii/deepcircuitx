  always @(posedge clk) 
    if (rst)
      cnt_pwron_r <= #TCQ 'b0;
    else if (pwron_ce_r)
      cnt_pwron_r <= #TCQ cnt_pwron_r + 1;

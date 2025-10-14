  always @(posedge clk)
    if (rst) begin
      cnt_pwron_ce_r <= #TCQ 10'h000;
      pwron_ce_r     <= #TCQ 1'b0;
    end else begin
      cnt_pwron_ce_r <= #TCQ cnt_pwron_ce_r + 1;
      pwron_ce_r     <= #TCQ (cnt_pwron_ce_r == 10'h3FF);
    end
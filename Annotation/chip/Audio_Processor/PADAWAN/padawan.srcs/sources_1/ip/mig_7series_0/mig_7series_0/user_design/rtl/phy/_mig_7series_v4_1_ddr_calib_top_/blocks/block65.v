  initial
  begin
    if (RANKS == 0) begin
      $display ("Error: Invalid RANKS parameter. Must be 1 or greater");
      $finish;
    end
    if (phy_ctl_full == 1'b1) begin
      $display ("Error: Incorrect phy_ctl_full input value in 2:1 or 4:1 mode");
      $finish;
    end
  end
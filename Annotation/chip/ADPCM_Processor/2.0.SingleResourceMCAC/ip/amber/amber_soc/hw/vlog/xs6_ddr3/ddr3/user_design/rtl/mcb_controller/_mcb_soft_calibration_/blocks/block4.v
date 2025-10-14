 always @(posedge UI_CLK)
  begin
    if (RST_reg)
        count <= 6'd0;
    else if (counter_en)
        count <= count + 1'b1;
    else
        count <= 6'd0;
  end
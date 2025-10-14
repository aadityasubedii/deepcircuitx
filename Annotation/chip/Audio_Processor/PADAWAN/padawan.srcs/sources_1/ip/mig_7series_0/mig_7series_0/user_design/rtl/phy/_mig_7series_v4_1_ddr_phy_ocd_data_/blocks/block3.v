  always @(*) begin
    second_half_ns = second_half_r;
    if (rst) second_half_ns = 1'b0;
    else second_half_ns = phy_rddata_en_1 ^ second_half_r;
  end
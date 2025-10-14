  generate if (nCK_PER_CLK == 4) begin
    assign last_byte_ns = phy_rddata_en_1 ? data_bytes[63:56] : last_byte_r;
  end else begin
    assign last_byte_ns = phy_rddata_en_1 ? data_bytes[31:24] : last_byte_r;
  end endgenerate
  always @(posedge i_clk) begin
    if (o_rst == 1) begin
      rst_count <= rst_count + 1;
    end
  end
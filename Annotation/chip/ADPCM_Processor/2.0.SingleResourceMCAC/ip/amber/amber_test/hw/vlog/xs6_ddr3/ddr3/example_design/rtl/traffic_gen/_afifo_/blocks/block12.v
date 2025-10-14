always @(posedge wr_clk)
begin
if (wr_en && !full)
  mem[wr_addr] <= #TCQ wr_data;

end
always @ (posedge clk_i) begin
  if (rst_i | reset_rd_addr)
    rd_addr <= #TCQ 'b0;
  
  else if (clk_en_i && prbs_rdlvl_done && (~phy_if_empty_r || ~complex_wr_done)) begin
    if (rd_addr == 'd156) rd_addr <= #TCQ 'b0;
    else rd_addr <= #TCQ rd_addr + 1;
  end
  
  else  if (clk_en_i && (~phy_if_empty_r || (~prbs_rdlvl_start && ~complex_wr_done))) begin
    if (rd_addr == 'd148) rd_addr <= #TCQ 'b0;
    else rd_addr <= #TCQ rd_addr+1;    
  end

end
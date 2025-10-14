always @ (posedge wb_clk_i)
begin
  if(cnt==1000) begin
    $display("(%0t)(%m) ERROR: WB activity ??? ", $time);
    if(s1_wb_cyc_o) begin
      $display("s1_wb_dat_o = 0x%0x", s1_wb_dat_o);
      $display("s1_wb_adr_o = 0x%0x", s1_wb_adr_o);
      $display("s1_wb_sel_o = 0x%0x", s1_wb_sel_o);
      $display("s1_wb_we_o = 0x%0x", s1_wb_we_o);
    end
    else if(s2_wb_cyc_o) begin
      $display("s2_wb_dat_o = 0x%0x", s2_wb_dat_o);
      $display("s2_wb_adr_o = 0x%0x", s2_wb_adr_o);
      $display("s2_wb_sel_o = 0x%0x", s2_wb_sel_o);
      $display("s2_wb_we_o = 0x%0x", s2_wb_we_o);
    end

    $stop;
  end
end
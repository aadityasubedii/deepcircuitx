always @ (posedge wb_clk_i)
begin
  if(s1_wb_err_i & s1_wb_cyc_o) begin
    $display("(%0t) ERROR: WB cycle finished with error acknowledge ", $time);
    $display("s1_wb_dat_o = 0x%0x", s1_wb_dat_o);
    $display("s1_wb_adr_o = 0x%0x", s1_wb_adr_o);
    $display("s1_wb_sel_o = 0x%0x", s1_wb_sel_o);
    $display("s1_wb_we_o = 0x%0x", s1_wb_we_o);
    $stop;
  end
  if(s2_wb_err_i & s2_wb_cyc_o) begin
    $display("(%0t) ERROR: WB cycle finished with error acknowledge ", $time);
    $display("s2_wb_dat_o = 0x%0x", s2_wb_dat_o);
    $display("s2_wb_adr_o = 0x%0x", s2_wb_adr_o);
    $display("s2_wb_sel_o = 0x%0x", s2_wb_sel_o);
    $display("s2_wb_we_o = 0x%0x", s2_wb_we_o);
    $stop;
  end
end
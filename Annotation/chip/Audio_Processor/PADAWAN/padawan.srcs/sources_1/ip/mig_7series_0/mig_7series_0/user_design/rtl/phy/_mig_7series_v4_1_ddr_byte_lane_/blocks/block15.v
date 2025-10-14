generate

if ( USE_PRE_POST_FIFO == "TRUE" ) begin : of_pre_fifo_gen
  assign {of_d9, of_d8, of_d7, of_d6, of_d5, of_d4, of_d3, of_d2, of_d1, of_d0} = pre_fifo_dout;
  mig_7series_v4_1_ddr_of_pre_fifo #
    (
     .TCQ   (25),    
     .DEPTH (9),     
     .WIDTH (80)     
     )
    u_ddr_of_pre_fifo
        (
       .clk       (phy_clk),
       .rst       (ofifo_rst),
       .full_in   (of_full),
       .wr_en_in  (phy_wr_en),
       .d_in      (phy_dout),
       .wr_en_out (of_wren_pre),
       .d_out     (pre_fifo_dout),
       .afull     (pre_fifo_a_full)
       );
end
else begin

  assign {of_d9, of_d8, of_d7, of_d6, of_d5, of_d4, of_d3, of_d2, of_d1, of_d0} = phy_dout;
  assign of_wren_pre = phy_wr_en;
end


endgenerate
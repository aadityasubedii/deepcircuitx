  generate
    begin

      mig_7series_v4_1_ddr_of_pre_fifo #
        (
         .TCQ   (25),
         .DEPTH (8),
         .WIDTH (32)
        )
        phy_ctl_pre_fifo_0
        (
         .clk       (clk),
         .rst       (rst),
         .full_in   (phy_ctl_full_temp[1]),
         .wr_en_in  (phy_ctl_wr),
         .d_in      (phy_ctl_wd),
         .wr_en_out (phy_ctl_wr_of),
         .d_out     (phy_ctl_wd_of)
        );

      mig_7series_v4_1_ddr_of_pre_fifo #
        (
         .TCQ   (25),
         .DEPTH (8),
         .WIDTH (6)
        )
        phy_ctl_pre_fifo_1
        (
         .clk       (clk),
         .rst       (rst),
         .full_in   (phy_ctl_full_temp[2]),
         .wr_en_in  (phy_ctl_wr),
         .d_in      (data_offset_1),
         .wr_en_out (),
         .d_out     (data_offset_1_of)
        );

      mig_7series_v4_1_ddr_of_pre_fifo #
        (
         .TCQ   (25),
         .DEPTH (8),
         .WIDTH (6)
        )
        phy_ctl_pre_fifo_2
        (
         .clk       (clk),
         .rst       (rst),
         .full_in   (phy_ctl_full_temp[3]),
         .wr_en_in  (phy_ctl_wr),
         .d_in      (data_offset_2),
         .wr_en_out (),
         .d_out     (data_offset_2_of)
        );

    end
  endgenerate
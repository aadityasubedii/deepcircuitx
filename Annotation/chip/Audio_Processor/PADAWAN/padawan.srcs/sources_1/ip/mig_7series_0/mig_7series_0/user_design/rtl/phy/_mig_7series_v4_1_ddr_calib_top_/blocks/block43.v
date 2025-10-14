  always @(posedge clk)
    phy_if_reset <= #TCQ (phy_if_reset_w | mpr_end_if_reset |
                          reset_if | wrlvl_final_if_rst | calib_tap_end_if_reset);

  always @(posedge clk) begin
    if (rst) begin
      calib_ctl_wren <= #TCQ 1'b0;
      calib_cmd_wren <= #TCQ 1'b0;
      calib_seq      <= #TCQ 2'b00;
    end else if (cnt_pwron_cke_done_r && phy_ctl_ready
                 && ~(phy_ctl_full || phy_cmd_full )) begin
      calib_ctl_wren <= #TCQ 1'b1;
      calib_cmd_wren <= #TCQ 1'b1;
      calib_seq      <= #TCQ calib_seq + 1;
    end else begin
      calib_ctl_wren <= #TCQ 1'b0;
      calib_cmd_wren <= #TCQ 1'b0;
      calib_seq      <= #TCQ calib_seq;
    end
  end
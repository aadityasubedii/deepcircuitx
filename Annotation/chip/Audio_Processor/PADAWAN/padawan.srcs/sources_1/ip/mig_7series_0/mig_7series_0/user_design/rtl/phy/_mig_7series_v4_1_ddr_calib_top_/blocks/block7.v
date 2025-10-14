    always @(posedge clk) begin
      if (rst) begin
        calib_po_coarse_tap_cnt <= #TCQ 'd0;
        calib_po_stage3_tap_cnt <= #TCQ 'd0;
        calib_po_stage2_tap_cnt <= #TCQ 'd0;
        calib_pi_stage2_tap_cnt <= #TCQ 'd0;
        calib_idelay_tap_cnt    <= #TCQ 'd0;
        calib_device_temp       <= #TCQ 'd0;
      end else if (calib_tap_load) begin
        case (calib_tap_addr[2:0])
          3'b000:
            calib_po_coarse_tap_cnt[3*calib_tap_addr[6:3]+:3] <= #TCQ calib_tap_val[2:0];
          3'b001:
            calib_po_stage3_tap_cnt[6*calib_tap_addr[6:3]+:6] <= #TCQ calib_tap_val[5:0];
          3'b010:
            calib_po_stage2_tap_cnt[6*calib_tap_addr[6:3]+:6] <= #TCQ calib_tap_val[5:0];
          3'b011:
            calib_pi_stage2_tap_cnt[6*calib_tap_addr[6:3]+:6] <= #TCQ calib_tap_val[5:0];
          3'b100:
            calib_idelay_tap_cnt[5*calib_tap_addr[6:3]+:5] <= #TCQ calib_tap_val[4:0];
          3'b110:
            if (&calib_tap_addr[6:3])
              calib_device_temp[7:0] <= #TCQ calib_tap_val[7:0];
          3'b111:
            if (&calib_tap_addr[6:3])
              calib_device_temp[11:8] <= #TCQ calib_tap_val[3:0];
          default:
            calib_po_coarse_tap_cnt[3*calib_tap_addr[6:3]+:3] <= #TCQ calib_tap_val[2:0];
        endcase
      end
    end
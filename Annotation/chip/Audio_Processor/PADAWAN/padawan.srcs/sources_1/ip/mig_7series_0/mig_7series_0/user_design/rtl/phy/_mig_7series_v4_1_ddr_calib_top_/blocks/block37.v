    always @(posedge clk) begin
      if (rst) begin
        byte_sel_cnt    <= #TCQ 'd0;
        ctl_lane_sel    <= #TCQ 'd0;
        calib_in_common <= #TCQ 1'b0;
      end else if (~skip_cal_po_pi_dec_done) begin
        byte_sel_cnt    <= #TCQ 'd0;
        calib_in_common <= #TCQ 1'b1;
      end else if (~ck_addr_cmd_delay_done && (WRLVL !="ON")) begin
        byte_sel_cnt    <= #TCQ 'd0;
        ctl_lane_sel    <= #TCQ 'd0;
        calib_in_common <= #TCQ 1'b1;
      end else if (~ck_addr_cmd_delay_done) begin
        ctl_lane_sel    <= #TCQ ctl_lane_cnt;
        calib_in_common <= #TCQ 1'b0;
      end else if (~fine_adjust_done && rd_data_offset_cal_done) begin
        if ((|pi_rst_stg1_cal) || (DRAM_TYPE == "DDR2")) begin
          byte_sel_cnt    <= #TCQ 'd0;
          ctl_lane_sel    <= #TCQ 'd0;
          calib_in_common <= #TCQ 1'b1;
        end else begin
          byte_sel_cnt    <= #TCQ 'd0;
          ctl_lane_sel    <= #TCQ fine_adjust_lane_cnt;
          calib_in_common <= #TCQ 1'b0;
        end
      end else if (~pi_calib_done) begin
        byte_sel_cnt    <= #TCQ 'd0;
        calib_in_common <= #TCQ 1'b1;
      end else if (~pi_dqs_found_done) begin
        byte_sel_cnt    <= #TCQ 'd0;
        calib_in_common <= #TCQ 1'b1;
      end else if (~calib_tap_inc_done) begin
        byte_sel_cnt    <= #TCQ calib_tap_inc_byte_cnt;
        calib_in_common <= #TCQ 1'b0;
      end else if (dbg_sel_pi_incdec_r | dbg_sel_po_incdec_r) begin
        byte_sel_cnt    <= #TCQ dbg_byte_sel;
        calib_in_common <= #TCQ 1'b0;
      end else if (tempmon_sel_pi_incdec) begin
        byte_sel_cnt    <= #TCQ 'd0;
        calib_in_common <= #TCQ 1'b1;
      end
    end
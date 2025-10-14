    always @(posedge clk) begin
      if (rst) begin
        byte_sel_cnt    <= #TCQ 'd0;
        ctl_lane_sel    <= #TCQ 'd0;
        calib_in_common <= #TCQ 1'b0;
      end else if (~(dqs_po_dec_done && pi_fine_dly_dec_done)) begin
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
      end else if (~wrlvl_done_w) begin
        if (SIM_CAL_OPTION != "FAST_CAL") begin
          byte_sel_cnt    <= #TCQ po_stg2_wl_cnt;
          calib_in_common <= #TCQ 1'b0;
        end else begin
          
          
          if (!phy_ctl_rdy_dly) begin
            byte_sel_cnt    <= #TCQ 'd0;
            calib_in_common <= #TCQ 1'b0;
          end else begin
            byte_sel_cnt    <= #TCQ po_stg2_wl_cnt;
            calib_in_common <= #TCQ 1'b1;
          end
        end
      end else if (~mpr_rdlvl_done) begin
        byte_sel_cnt    <= #TCQ pi_stg2_rdlvl_cnt;
        calib_in_common <= #TCQ 1'b0;
      end else if (~oclkdelay_calib_done) begin
        byte_sel_cnt    <= #TCQ oclkdelay_calib_cnt;
        calib_in_common <= #TCQ 1'b0;
      end else if (~rdlvl_stg1_done && pi_calib_done) begin
        if ((SIM_CAL_OPTION == "FAST_CAL") && rdlvl_assrt_common) begin
          byte_sel_cnt    <= #TCQ pi_stg2_rdlvl_cnt;
          calib_in_common <= #TCQ 1'b1;
        end else begin
          byte_sel_cnt    <= #TCQ pi_stg2_rdlvl_cnt;
          calib_in_common <= #TCQ 1'b0;
        end
      end else if (~prbs_rdlvl_done && rdlvl_stg1_done) begin
        byte_sel_cnt    <= #TCQ pi_stg2_prbs_rdlvl_cnt;
        calib_in_common <= #TCQ 1'b0;
      end else if (~complex_oclkdelay_calib_done_w && prbs_rdlvl_done) begin
        byte_sel_cnt    <= #TCQ complex_oclkdelay_calib_cnt;
            calib_in_common <= #TCQ 1'b0;
      end else if ((~wrcal_done) && (DRAM_TYPE == "DDR3")) begin
        byte_sel_cnt    <= #TCQ po_stg2_wrcal_cnt;
        calib_in_common <= #TCQ 1'b0;
      end else if (dbg_sel_pi_incdec_r | dbg_sel_po_incdec_r) begin
        byte_sel_cnt    <= #TCQ dbg_byte_sel;
        calib_in_common <= #TCQ 1'b0;
      end else if (tempmon_sel_pi_incdec) begin
        byte_sel_cnt    <= #TCQ 'd0;
        calib_in_common <= #TCQ 1'b1;
      end
    end
  always @(posedge clk) begin
    if (rst || (calib_complete && ~ (dbg_sel_pi_incdec_r|dbg_sel_po_incdec_r|tempmon_sel_pi_incdec) )) begin
      calib_sel         <= #TCQ 6'b000100;
      calib_zero_inputs <= #TCQ {HIGHEST_BANK{1'b1}};
      calib_zero_ctrl   <= #TCQ {HIGHEST_BANK{1'b1}};
    end else if (~(dqs_po_dec_done && pi_fine_dly_dec_done) || ~skip_cal_po_pi_dec_done) begin
      calib_sel[2]   <= #TCQ 1'b0;
      calib_sel[1:0] <= #TCQ DQS_BYTE_MAP[(byte_sel_cnt*8)+:2];
      calib_sel[5:3] <= #TCQ DQS_BYTE_MAP[((byte_sel_cnt*8)+4)+:3];
      calib_zero_inputs <= #TCQ {HIGHEST_BANK{1'b0}};
      if (~dqs_po_dec_done && (WRLVL != "ON"))
      
        calib_zero_ctrl   <= #TCQ {HIGHEST_BANK{1'b0}};
      else
        calib_zero_ctrl   <= #TCQ {HIGHEST_BANK{1'b1}};
    end else if (~ck_addr_cmd_delay_done || (~fine_adjust_done && rd_data_offset_cal_done)) begin
      if(WRLVL =="ON") begin
        calib_sel[2]   <= #TCQ 1'b0;
        calib_sel[1:0] <= #TCQ CTL_BYTE_LANE[(ctl_lane_sel*2)+:2];
        calib_sel[5:3] <= #TCQ CTL_BANK;
        if (|pi_rst_stg1_cal) begin
          calib_zero_inputs <= #TCQ {HIGHEST_BANK{1'b0}};
        end else begin
          calib_zero_inputs <= #TCQ {HIGHEST_BANK{1'b1}};
          calib_zero_inputs[1*CTL_BANK] <= #TCQ 1'b0;
        end
        calib_zero_ctrl   <= #TCQ {HIGHEST_BANK{1'b1}};
      end else begin 
        calib_sel[2]   <= #TCQ 1'b0;
        calib_sel[1:0] <= #TCQ DQS_BYTE_MAP[(byte_sel_cnt*8)+:2];
        calib_sel[5:3] <= #TCQ DQS_BYTE_MAP[((byte_sel_cnt*8)+4)+:3];
        calib_zero_inputs <= #TCQ {HIGHEST_BANK{1'b0}};
        if(~ck_addr_cmd_delay_done)
        calib_zero_ctrl   <= #TCQ {HIGHEST_BANK{1'b1}};
        else
          calib_zero_ctrl   <= #TCQ {HIGHEST_BANK{1'b0}};
      end 
    end else if ((~wrlvl_done_w) && (SIM_CAL_OPTION == "FAST_CAL")) begin
      calib_sel[2]   <= #TCQ 1'b0;
      calib_sel[1:0] <= #TCQ DQS_BYTE_MAP[(byte_sel_cnt*8)+:2];
      calib_sel[5:3] <= #TCQ DQS_BYTE_MAP[((byte_sel_cnt*8)+4)+:3];
      calib_zero_inputs <= #TCQ {HIGHEST_BANK{1'b0}};
      calib_zero_ctrl   <= #TCQ {HIGHEST_BANK{1'b1}};
    end else if (~rdlvl_stg1_done && (SIM_CAL_OPTION == "FAST_CAL") &&
                 rdlvl_assrt_common) begin
      calib_sel[2]   <= #TCQ 1'b0;
      calib_sel[1:0] <= #TCQ DQS_BYTE_MAP[(byte_sel_cnt*8)+:2];
      calib_sel[5:3] <= #TCQ DQS_BYTE_MAP[((byte_sel_cnt*8)+4)+:3];
      calib_zero_inputs <= #TCQ {HIGHEST_BANK{1'b0}};
      calib_zero_ctrl   <= #TCQ {HIGHEST_BANK{1'b1}};
    end else if (tempmon_sel_pi_incdec) begin
      calib_sel[2]   <= #TCQ 1'b0;
      calib_sel[1:0] <= #TCQ DQS_BYTE_MAP[(byte_sel_cnt*8)+:2];
      calib_sel[5:3] <= #TCQ DQS_BYTE_MAP[((byte_sel_cnt*8)+4)+:3];
      calib_zero_inputs <= #TCQ {HIGHEST_BANK{1'b0}};
      calib_zero_ctrl   <= #TCQ {HIGHEST_BANK{1'b1}};
    end else begin
      calib_sel[2]   <= #TCQ 1'b0;
      calib_sel[1:0] <= #TCQ DQS_BYTE_MAP[(byte_sel_cnt*8)+:2];
      calib_sel[5:3] <= #TCQ DQS_BYTE_MAP[((byte_sel_cnt*8)+4)+:3];
      calib_zero_ctrl   <= #TCQ {HIGHEST_BANK{1'b1}};
      if (~calib_in_common) begin
        calib_zero_inputs <= #TCQ {HIGHEST_BANK{1'b1}};
        calib_zero_inputs[(1*DQS_BYTE_MAP[((byte_sel_cnt*8)+4)+:3])] <= #TCQ 1'b0;
      end else
        calib_zero_inputs <= #TCQ {HIGHEST_BANK{1'b0}};
    end
  end
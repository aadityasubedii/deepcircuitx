  always @(posedge clk) begin
    if (wr_level_dqs_asrt) begin
      
      calib_cmd         <= #TCQ 3'b001;
      if (CWL_M % 2) begin 
        calib_data_offset_0 <= #TCQ CWL_M + 3;
        calib_data_offset_1 <= #TCQ CWL_M + 3;
        calib_data_offset_2 <= #TCQ CWL_M + 3;
        calib_cas_slot      <= #TCQ 2'b01;
      end else begin 
        calib_data_offset_0 <= #TCQ CWL_M + 2;
        calib_data_offset_1 <= #TCQ CWL_M + 2;
        calib_data_offset_2 <= #TCQ CWL_M + 2;
        calib_cas_slot      <= #TCQ 2'b00;
      end
    end else if (rdlvl_wr && new_burst_r) begin
      
      calib_cmd         <= #TCQ 3'b001;
      if (CWL_M % 2) begin 
        calib_data_offset_0 <= #TCQ (nCK_PER_CLK == 4) ? CWL_M + 3 : CWL_M  - 1;
        calib_data_offset_1 <= #TCQ (nCK_PER_CLK == 4) ? CWL_M + 3 : CWL_M  - 1;
        calib_data_offset_2 <= #TCQ (nCK_PER_CLK == 4) ? CWL_M + 3 : CWL_M  - 1;
        calib_cas_slot      <= #TCQ 2'b01;
      end else begin 
        calib_data_offset_0 <= #TCQ (nCK_PER_CLK == 4) ? CWL_M + 2 : CWL_M - 2 ;
        calib_data_offset_1 <= #TCQ (nCK_PER_CLK == 4) ? CWL_M + 2 : CWL_M - 2 ;
        calib_data_offset_2 <= #TCQ (nCK_PER_CLK == 4) ? CWL_M + 2 : CWL_M - 2 ;
        calib_cas_slot      <= #TCQ 2'b00;
      end
    end else if (rdlvl_rd && new_burst_r) begin
      
      calib_cmd         <= #TCQ 3'b011;
      if (CWL_M % 2)
        calib_cas_slot    <= #TCQ 2'b01;
      else
        calib_cas_slot    <= #TCQ 2'b00;
      if (~pi_calib_done_r1) begin
        calib_data_offset_0 <= #TCQ 6'd0;
        calib_data_offset_1 <= #TCQ 6'd0;
        calib_data_offset_2 <= #TCQ 6'd0;
      end else if (~pi_dqs_found_done_r1) begin
        calib_data_offset_0 <= #TCQ rd_data_offset_0;
        calib_data_offset_1 <= #TCQ rd_data_offset_1;
        calib_data_offset_2 <= #TCQ rd_data_offset_2;
      end else begin
        calib_data_offset_0 <= #TCQ rd_data_offset_ranks_0[6*chip_cnt_r+:6];
        calib_data_offset_1 <= #TCQ rd_data_offset_ranks_1[6*chip_cnt_r+:6];
        calib_data_offset_2 <= #TCQ rd_data_offset_ranks_2[6*chip_cnt_r+:6];
      end
    end else begin
      
      
      calib_cmd           <= #TCQ 3'b100;
      calib_data_offset_0 <= #TCQ 6'd0;
      calib_data_offset_1 <= #TCQ 6'd0;
      calib_data_offset_2 <= #TCQ 6'd0;
      if (CWL_M % 2)
        calib_cas_slot    <= #TCQ 2'b01;
      else
        calib_cas_slot    <= #TCQ 2'b00;
    end
  end
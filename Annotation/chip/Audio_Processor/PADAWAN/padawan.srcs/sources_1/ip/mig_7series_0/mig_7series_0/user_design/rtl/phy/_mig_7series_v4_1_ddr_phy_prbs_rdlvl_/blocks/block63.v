      always @(posedge clk) begin
        mux_rd_rise0_r1[mux_i] <= #TCQ rd_data_rise0[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        mux_rd_fall0_r1[mux_i] <= #TCQ rd_data_fall0[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        mux_rd_rise1_r1[mux_i] <= #TCQ rd_data_rise1[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        mux_rd_fall1_r1[mux_i] <= #TCQ rd_data_fall1[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        mux_rd_rise2_r1[mux_i] <= #TCQ rd_data_rise2[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        mux_rd_fall2_r1[mux_i] <= #TCQ rd_data_fall2[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        mux_rd_rise3_r1[mux_i] <= #TCQ rd_data_rise3[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        mux_rd_fall3_r1[mux_i] <= #TCQ rd_data_fall3[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        
        compare_data_rise0_r1[mux_i]  <= #TCQ compare_data_r0[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        compare_data_fall0_r1[mux_i]  <= #TCQ compare_data_f0[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        compare_data_rise1_r1[mux_i]  <= #TCQ compare_data_r1[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        compare_data_fall1_r1[mux_i]  <= #TCQ compare_data_f1[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        compare_data_rise2_r1[mux_i]  <= #TCQ compare_data_r2[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        compare_data_fall2_r1[mux_i]  <= #TCQ compare_data_f2[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        compare_data_rise3_r1[mux_i]  <= #TCQ compare_data_r3[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        compare_data_fall3_r1[mux_i]  <= #TCQ compare_data_f3[DRAM_WIDTH*rd_mux_sel_r + mux_i];
      end
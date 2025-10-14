        always @(posedge clk) begin
          mux_rd_rise0_r[mux_i] <= #TCQ rd_data_rise0[DRAM_WIDTH*rd_mux_sel_r + mux_i];
          mux_rd_fall0_r[mux_i] <= #TCQ rd_data_fall0[DRAM_WIDTH*rd_mux_sel_r + mux_i];
          mux_rd_rise1_r[mux_i] <= #TCQ rd_data_rise1[DRAM_WIDTH*rd_mux_sel_r + mux_i];
          mux_rd_fall1_r[mux_i] <= #TCQ rd_data_fall1[DRAM_WIDTH*rd_mux_sel_r + mux_i];
        end
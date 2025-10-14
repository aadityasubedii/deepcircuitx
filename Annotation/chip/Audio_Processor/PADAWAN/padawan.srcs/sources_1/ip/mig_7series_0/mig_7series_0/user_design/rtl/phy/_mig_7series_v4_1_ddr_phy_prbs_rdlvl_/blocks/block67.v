    end else begin: rd_data_div2_logic_clk
      assign rd_data_rise0 = rd_data[DQ_WIDTH-1:0];
      assign rd_data_fall0 = rd_data[2*DQ_WIDTH-1:DQ_WIDTH];
      assign rd_data_rise1 = rd_data[3*DQ_WIDTH-1:2*DQ_WIDTH];
      assign rd_data_fall1 = rd_data[4*DQ_WIDTH-1:3*DQ_WIDTH];
      assign compare_data_r0 = compare_data[DQ_WIDTH-1:0];
      assign compare_data_f0 = compare_data[2*DQ_WIDTH-1:DQ_WIDTH];
      assign compare_data_r1 = compare_data[3*DQ_WIDTH-1:2*DQ_WIDTH];
      assign compare_data_f1 = compare_data[4*DQ_WIDTH-1:3*DQ_WIDTH];
      assign compare_data_r2 = 'h0;
      assign compare_data_f2 = 'h0;
      assign compare_data_r3 = 'h0;
      assign compare_data_f3 = 'h0;
    end
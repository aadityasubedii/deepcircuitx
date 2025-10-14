  generate
    if (nCK_PER_CLK == 4) begin: rd_data_div4_logic_clk
      assign rd_data_rise0 = rd_data[DQ_WIDTH-1:0];
      assign rd_data_fall0 = rd_data[2*DQ_WIDTH-1:DQ_WIDTH];
      assign rd_data_rise1 = rd_data[3*DQ_WIDTH-1:2*DQ_WIDTH];
      assign rd_data_fall1 = rd_data[4*DQ_WIDTH-1:3*DQ_WIDTH];
      assign rd_data_rise2 = rd_data[5*DQ_WIDTH-1:4*DQ_WIDTH];
      assign rd_data_fall2 = rd_data[6*DQ_WIDTH-1:5*DQ_WIDTH];
      assign rd_data_rise3 = rd_data[7*DQ_WIDTH-1:6*DQ_WIDTH];
      assign rd_data_fall3 = rd_data[8*DQ_WIDTH-1:7*DQ_WIDTH];
    end else begin: rd_data_div2_logic_clk
      assign rd_data_rise0 = rd_data[DQ_WIDTH-1:0];
      assign rd_data_fall0 = rd_data[2*DQ_WIDTH-1:DQ_WIDTH];
      assign rd_data_rise1 = rd_data[3*DQ_WIDTH-1:2*DQ_WIDTH];
      assign rd_data_fall1 = rd_data[4*DQ_WIDTH-1:3*DQ_WIDTH];
    end
  endgenerate
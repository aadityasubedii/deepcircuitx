      16'h3142: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[1] >> (LP_DDR_CK_WIDTH*i+12)) & 2'b11;
      16'h3143: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[1] >> (LP_DDR_CK_WIDTH*i+24)) & 2'b11;
      16'h3144: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[1] >> (LP_DDR_CK_WIDTH*i+36)) & 2'b11;
      16'h3241: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[2] >> (LP_DDR_CK_WIDTH*i)) & 2'b11;
      16'h3242: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[2] >> (LP_DDR_CK_WIDTH*i+12)) & 2'b11;
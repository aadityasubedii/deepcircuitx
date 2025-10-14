      16'h3041: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[0] >> (LP_DDR_CK_WIDTH*i)) & 2'b11;
      16'h3042: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[0] >> (LP_DDR_CK_WIDTH*i+12)) & 2'b11;
      16'h3043: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[0] >> (LP_DDR_CK_WIDTH*i+24)) & 2'b11;
      16'h3044: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[0] >> (LP_DDR_CK_WIDTH*i+36)) & 2'b11;
      16'h3141: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[1] >> (LP_DDR_CK_WIDTH*i)) & 2'b11;
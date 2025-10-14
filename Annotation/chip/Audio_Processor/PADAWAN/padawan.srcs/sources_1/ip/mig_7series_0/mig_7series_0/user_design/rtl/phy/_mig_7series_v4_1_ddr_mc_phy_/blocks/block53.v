generate
genvar i;
for (i = 0; i != NUM_DDR_CK; i = i + 1) begin : ddr_clk_gen
   case  ((GENERATE_DDR_CK_MAP >> (16*i)) & 16'hffff)
      16'h3041: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[0] >> (LP_DDR_CK_WIDTH*i)) & 2'b11;
      16'h3042: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[0] >> (LP_DDR_CK_WIDTH*i+12)) & 2'b11;
      16'h3043: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[0] >> (LP_DDR_CK_WIDTH*i+24)) & 2'b11;
      16'h3044: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[0] >> (LP_DDR_CK_WIDTH*i+36)) & 2'b11;
      16'h3141: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[1] >> (LP_DDR_CK_WIDTH*i)) & 2'b11;
      16'h3142: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[1] >> (LP_DDR_CK_WIDTH*i+12)) & 2'b11;
      16'h3143: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[1] >> (LP_DDR_CK_WIDTH*i+24)) & 2'b11;
      16'h3144: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[1] >> (LP_DDR_CK_WIDTH*i+36)) & 2'b11;
      16'h3241: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[2] >> (LP_DDR_CK_WIDTH*i)) & 2'b11;
      16'h3242: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[2] >> (LP_DDR_CK_WIDTH*i+12)) & 2'b11;
      16'h3243: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[2] >> (LP_DDR_CK_WIDTH*i+24)) & 2'b11;
      16'h3244: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[2] >> (LP_DDR_CK_WIDTH*i+36)) & 2'b11;
      default : initial $display("ERROR: mc_phy ddr_clk_gen : invalid specification for parameter GENERATE_DDR_CK_MAP , clock index =  %d, spec= %x (hex) ",  i, (( GENERATE_DDR_CK_MAP >> (16 * i )) & 16'hffff ));
   endcase
end
endgenerate
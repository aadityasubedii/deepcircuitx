      16'h3243: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[2] >> (LP_DDR_CK_WIDTH*i+24)) & 2'b11;
      16'h3244: assign ddr_clk[(i+1)*LP_DDR_CK_WIDTH-1:(i*LP_DDR_CK_WIDTH)] = (ddr_clk_w[2] >> (LP_DDR_CK_WIDTH*i+36)) & 2'b11;
      default : initial $display("ERROR: mc_phy ddr_clk_gen : invalid specification for parameter GENERATE_DDR_CK_MAP , clock index =  %d, spec= %x (hex) ",  i, (( GENERATE_DDR_CK_MAP >> (16 * i )) & 16'hffff ));
   endcase
end
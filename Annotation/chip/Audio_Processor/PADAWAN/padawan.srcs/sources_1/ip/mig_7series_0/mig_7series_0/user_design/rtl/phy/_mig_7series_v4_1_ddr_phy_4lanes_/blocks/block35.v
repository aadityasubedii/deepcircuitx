assign ddr_clk[LP_DDR_CK_WIDTH*6-1:0]                   = A_ddr_clk;
assign ddr_clk[LP_DDR_CK_WIDTH*12-1:LP_DDR_CK_WIDTH*6]  = B_ddr_clk;
assign ddr_clk[LP_DDR_CK_WIDTH*18-1:LP_DDR_CK_WIDTH*12] = C_ddr_clk;
assign ddr_clk[LP_DDR_CK_WIDTH*24-1:LP_DDR_CK_WIDTH*18] = D_ddr_clk;

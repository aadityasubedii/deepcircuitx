  always @(posedge MCLK_44K_clk_wiz_0_en_clk)
        seq_reg2 <= {seq_reg2[6:0],locked_int};
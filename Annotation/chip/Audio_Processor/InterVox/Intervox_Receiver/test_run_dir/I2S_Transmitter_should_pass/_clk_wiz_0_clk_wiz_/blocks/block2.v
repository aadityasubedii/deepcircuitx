  always @(posedge MCLK_48K_clk_wiz_0_en_clk)
        seq_reg1 <= {seq_reg1[6:0],locked_int};
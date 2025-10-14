      always @(posedge xadc_clk)
        sample_en <= #TCQ (sample_timer == nTEMPSAMP_CLKS_M6) ? 1'b1 : 1'b0;

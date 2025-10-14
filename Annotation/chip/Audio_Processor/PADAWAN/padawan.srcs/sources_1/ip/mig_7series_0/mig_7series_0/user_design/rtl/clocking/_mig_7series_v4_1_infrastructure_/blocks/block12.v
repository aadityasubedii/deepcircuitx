      always @(posedge clk) pdiff = $time() - rising_mmcm_ps_clk;
    end
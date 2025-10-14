  initial begin
    $display("############# Write Clocks PLLE2_ADV Parameters #############\n");
    $display("nCK_PER_CLK      = %7d",   nCK_PER_CLK     );
    $display("CLK_PERIOD       = %7d",   CLKIN_PERIOD    );
    $display("CLKIN1_PERIOD    = %7.3f", CLKIN1_PERIOD_NS);
    $display("DIVCLK_DIVIDE    = %7d",   DIVCLK_DIVIDE   );
    $display("CLKFBOUT_MULT    = %7d",   CLKFBOUT_MULT );
    $display("VCO_PERIOD       = %7.1f", VCO_PERIOD      );
    $display("CLKOUT0_DIVIDE_F = %7d",   CLKOUT0_DIVIDE  );
    $display("CLKOUT1_DIVIDE   = %7d",   CLKOUT1_DIVIDE  );
    $display("CLKOUT2_DIVIDE   = %7d",   CLKOUT2_DIVIDE  );
    $display("CLKOUT3_DIVIDE   = %7d",   CLKOUT3_DIVIDE  );
    $display("CLKOUT0_PERIOD   = %7d",   CLKOUT0_PERIOD  );
    $display("CLKOUT1_PERIOD   = %7d",   CLKOUT1_PERIOD  );
    $display("CLKOUT2_PERIOD   = %7d",   CLKOUT2_PERIOD  );
    $display("CLKOUT3_PERIOD   = %7d",   CLKOUT3_PERIOD  );
    $display("CLKOUT4_PERIOD   = %7d",   CLKOUT4_PERIOD  );
    $display("############################################################\n");
  end
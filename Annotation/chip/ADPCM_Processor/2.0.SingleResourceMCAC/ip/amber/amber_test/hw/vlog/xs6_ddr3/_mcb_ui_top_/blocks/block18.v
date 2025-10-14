  generate
    if (C_MCB_USE_EXTERNAL_BUFPLL == 0) begin : gen_spartan6_bufpll_mcb
      
      BUFPLL_MCB #
      (
      .DIVIDE   (2),
      .LOCK_SRC ("LOCK_TO_0")
      )
      bufpll_0
        (
        .IOCLK0       (ioclk0),
        .IOCLK1       (ioclk180),
        .GCLK         (ui_clk),
        .LOCKED       (pll_lock),
        .LOCK         (pll_lock_bufpll_o),
        .SERDESSTROBE0(pll_ce_0_i),
        .SERDESSTROBE1(pll_ce_90_i),
        .PLLIN0       (sysclk_2x),
        .PLLIN1       (sysclk_2x_180)
        );
      end else begin : gen_spartan6_no_bufpll_mcb
        
        assign pll_ce_0_i   = pll_ce_0;
        assign pll_ce_90_i  = pll_ce_90;
        assign ioclk0     = sysclk_2x;
        assign ioclk180   = sysclk_2x_180;
        assign pll_lock_bufpll_o = pll_lock;
      end
  endgenerate
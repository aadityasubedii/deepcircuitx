  generate
    if (REFCLK_TYPE == "DIFFERENTIAL") begin: diff_clk_ref
      IBUFGDS #
        (
         .DIFF_TERM    (DIFF_TERM_REFCLK),
         .IBUF_LOW_PWR ("FALSE")
         )
        u_ibufg_clk_ref
          (
           .I  (clk_ref_p),
           .IB (clk_ref_n),
           .O  (clk_ref_ibufg)
           );

    end else if (REFCLK_TYPE == "SINGLE_ENDED") begin : se_clk_ref
      IBUFG #
        (
         .IBUF_LOW_PWR ("FALSE")
         )
        u_ibufg_clk_ref
          (
           .I (clk_ref_i),
           .O (clk_ref_ibufg)
           );

    end else if ((REFCLK_TYPE == "NO_BUFFER") ||
                 (REFCLK_TYPE == "USE_SYSTEM_CLOCK" && SYSCLK_TYPE == "NO_BUFFER")) begin : clk_ref_noibuf_nobuf
      assign clk_ref_ibufg = clk_ref_i;
    end else if (REFCLK_TYPE == "USE_SYSTEM_CLOCK" && SYSCLK_TYPE != "NO_BUFFER") begin : clk_ref_noibuf
      assign clk_ref_ibufg = clk_ref_i;
    end
  endgenerate
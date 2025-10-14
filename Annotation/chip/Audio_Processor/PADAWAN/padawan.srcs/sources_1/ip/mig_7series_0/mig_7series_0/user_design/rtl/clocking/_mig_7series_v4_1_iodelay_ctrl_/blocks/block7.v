  generate
    if ((REFCLK_TYPE == "DIFFERENTIAL") || 
        (REFCLK_TYPE == "SINGLE_ENDED") ||
        (REFCLK_TYPE == "USE_SYSTEM_CLOCK" && SYSCLK_TYPE != "NO_BUFFER")) begin: clk_ref_200
      BUFG u_bufg_clk_ref
       (
        .O (clk_ref[0]),
        .I (clk_ref_ibufg)
        );
    end else begin: clk_ref_200_no_buffer
      assign clk_ref[0] = clk_ref_i;
    end
  endgenerate
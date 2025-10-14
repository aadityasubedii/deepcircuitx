  generate
    if (SYSCLK_TYPE == "DIFFERENTIAL") begin: diff_input_clk

      
      
      

      IBUFGDS #
        (
         .DIFF_TERM    (DIFF_TERM_SYSCLK),
         .IBUF_LOW_PWR ("FALSE")
         )
        u_ibufg_sys_clk
          (
           .I  (sys_clk_p),
           .IB (sys_clk_n),
           .O  (sys_clk_ibufg)
           );

    end else if (SYSCLK_TYPE == "SINGLE_ENDED") begin: se_input_clk

      
      
      

      IBUFG #
        (
         .IBUF_LOW_PWR ("FALSE")
         )
        u_ibufg_sys_clk
          (
           .I  (sys_clk_i),
           .O  (sys_clk_ibufg)
           );
    end else if (SYSCLK_TYPE == "NO_BUFFER") begin: internal_clk

      
      
      
      assign sys_clk_ibufg = sys_clk_i;
   end
  endgenerate
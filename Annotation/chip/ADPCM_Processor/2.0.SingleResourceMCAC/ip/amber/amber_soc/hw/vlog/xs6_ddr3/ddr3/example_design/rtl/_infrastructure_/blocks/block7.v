  generate
    if (C_INPUT_CLK_TYPE == "DIFFERENTIAL") begin: diff_input_clk

      
      
      

      IBUFGDS #
        (
         .DIFF_TERM    ("TRUE")
         )
        u_ibufg_sys_clk
          (
           .I  (sys_clk_p),
           .IB (sys_clk_n),
           .O  (sys_clk_ibufg)
           );

    end else if (C_INPUT_CLK_TYPE == "SINGLE_ENDED") begin: se_input_clk

      
      
      

      IBUFG  u_ibufg_sys_clk
          (
           .I  (sys_clk),
           .O  (sys_clk_ibufg)
           );
   end
  endgenerate
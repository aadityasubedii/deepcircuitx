  generate
    if (REF_CLK_MMCM_IODELAY_CTRL == "TRUE") begin: idelayctrl_gen_1
      (* IODELAY_GROUP = IODELAY_GRP1 *) IDELAYCTRL u_idelayctrl_300_400
        (
         .RDY    (iodelay_ctrl_rdy[1]),
         .REFCLK (clk_ref[1]),
         .RST    (rst_ref[1])
         );
    end
  endgenerate
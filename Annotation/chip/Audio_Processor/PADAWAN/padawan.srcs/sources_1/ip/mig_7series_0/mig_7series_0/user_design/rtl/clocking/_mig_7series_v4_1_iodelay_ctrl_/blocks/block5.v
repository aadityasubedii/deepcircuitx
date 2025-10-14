  generate
    if (REF_CLK_MMCM_IODELAY_CTRL == "TRUE") begin: rst_ref_gen_1
      always @(posedge clk_ref[1] or posedge rst_tmp_idelay)
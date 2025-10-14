generate
if (CMD_PATTERN == "CGEN_PRBS" || CMD_PATTERN == "CGEN_ALL" ) begin: gen_prbs_addr
cmd_prbs_gen #
  ( 
    .TCQ               (TCQ),
    .FAMILY      (FAMILY),
    .ADDR_WIDTH          (32),
    .DWIDTH     (DWIDTH),
    .PRBS_WIDTH (32),
    .SEED_WIDTH (32),
    .PRBS_EADDR_MASK_POS          (PRBS_EADDR_MASK_POS ),
    .PRBS_SADDR_MASK_POS           (PRBS_SADDR_MASK_POS  ),
    .PRBS_EADDR         (PRBS_EADDR),
    .PRBS_SADDR          (PRBS_SADDR )
   )
   addr_prbs_gen
  (
   .clk_i            (clk_i),
   .clk_en           (cmd_clk_en),
   .prbs_seed_init   (mode_load_pulse),
   .prbs_seed_i      (cmd_seed_i[31:0]),
   .prbs_o           (prbs_addr)
  );
end
endgenerate
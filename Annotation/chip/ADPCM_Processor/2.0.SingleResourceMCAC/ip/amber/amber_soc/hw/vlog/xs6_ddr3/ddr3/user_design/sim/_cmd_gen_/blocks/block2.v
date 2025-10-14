generate
if (CMD_PATTERN == "CGEN_PRBS" || CMD_PATTERN == "CGEN_ALL" ) begin: gen_prbs_bl
cmd_prbs_gen #
      (
    .TCQ               (TCQ),      
    .FAMILY      (FAMILY),
    .PRBS_CMD    ("BLEN"),
    .ADDR_WIDTH  (32),
    .SEED_WIDTH  (15),
    .PRBS_WIDTH  (20)
   )
   bl_prbs_gen
  (
   .clk_i             (clk_i),
   .clk_en            (cmd_clk_en),
   .prbs_seed_init    (load_seed_i),
   .prbs_seed_i       (cmd_seed_i[16:2]),
   .prbs_o            (prbs_bl)
  );
end
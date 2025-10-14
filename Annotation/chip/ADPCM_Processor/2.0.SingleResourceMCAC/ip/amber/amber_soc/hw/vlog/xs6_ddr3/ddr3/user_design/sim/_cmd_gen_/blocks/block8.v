generate  


if (CMD_PATTERN == "CGEN_PRBS" || CMD_PATTERN == "CGEN_ALL" ) begin: gen_prbs_instr
cmd_prbs_gen #
  (
    .TCQ               (TCQ),
    .PRBS_CMD    ("INSTR"),
    .ADDR_WIDTH  (32),
    .SEED_WIDTH  (15),
    .PRBS_WIDTH  (20)
   )
   instr_prbs_gen_a
  (
   .clk_i              (clk_i),
   .clk_en             (cmd_clk_en),
   .prbs_seed_init     (load_seed_i),
   .prbs_seed_i        (cmd_seed_i[14:0]),
   .prbs_o             (prbs_instr_a)
  );

cmd_prbs_gen #
  (
    .PRBS_CMD    ("INSTR"),
    .SEED_WIDTH  (15),
    .PRBS_WIDTH  (20)
   )
   instr_prbs_gen_b
  (
   .clk_i              (clk_i),
   .clk_en             (cmd_clk_en),
   .prbs_seed_init     (load_seed_i),
   .prbs_seed_i        (cmd_seed_i[16:2]),
   .prbs_o             (prbs_instr_b)
  );
end
endgenerate
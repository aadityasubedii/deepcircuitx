  ring_control #(
    .CLKMUX_BITS(3),
    .TRIM_BITS(26)
  ) ring1 (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    .wb_stb_i(ring1_stb_i),
    .wb_cyc_i(ring1_cyc_i),
    .wb_we_i(ring1_we_i),
    .wb_sel_i(ring1_sel_i),
    .wb_dat_i(ring1_dat_i),
    .wb_adr_i(ring1_adr_i),

    .wb_ack_o(ring1_ack_o),
    .wb_dat_o(ring1_dat_o),

    .ring_clk(ring1_clk),
    .ring_start(ring1_start),
    .ring_trim_a(ring1_trim_a),
    .ring_trim_b(),
    .ring_clkmux(ring1_clkmux),

    .test_en(ring1_test_en),
    .test_out(ring1_test_out)
  );
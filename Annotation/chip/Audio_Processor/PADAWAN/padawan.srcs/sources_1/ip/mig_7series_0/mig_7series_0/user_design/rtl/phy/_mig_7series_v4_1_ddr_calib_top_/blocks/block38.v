generate
  if (SKIP_CALIB == "TRUE") begin: gen_byte_sel_skip_calib
    always @(posedge clk) begin
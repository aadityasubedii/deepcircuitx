  wire [63:0] r_vibrato_depths;
  rom_async #(
    .WIDTH(64),
    .DEPTH(8),
    .FILE(VIBRATO_TABLE_FILE)
  ) vibrato_table (
    .addr(r_vibrato_depth),
    .data(r_vibrato_depths)
  );
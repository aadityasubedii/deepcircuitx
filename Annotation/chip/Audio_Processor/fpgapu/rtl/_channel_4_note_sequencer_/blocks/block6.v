  wire   [31:0]  r_phase_delta;
  rom_async #(
    .WIDTH(32),
    .DEPTH(4),
    .FILE(NOISE_TABLE_FILE)
  ) noise_table (
    .addr(r_note),
    .data(r_phase_delta)
  );
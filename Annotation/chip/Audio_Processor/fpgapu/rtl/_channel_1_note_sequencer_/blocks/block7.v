  wire r_new_vibrato = i_note_stb & (r_vibrato_len_count == r_vibrato_len);

  reg [2:0] r_vibrato_depth = 0;
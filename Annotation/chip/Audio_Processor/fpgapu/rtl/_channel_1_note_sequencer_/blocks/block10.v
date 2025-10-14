  assign o_top = 8'hff;
  assign o_top_valid = 1;
  wire [31:0] w_phase_delta;
  note_table #(.FILE(NOTE_TABLE_FILE)) note_table
    (.i_note(r_note), .o_compare(w_phase_delta));
  assign o_envelope = r_envelope;
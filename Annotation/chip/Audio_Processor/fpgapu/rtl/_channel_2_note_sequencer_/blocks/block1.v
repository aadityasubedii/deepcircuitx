  assign o_top = 8'hff;
  assign o_top_valid = 1;
  note_table #(.FILE(NOTE_TABLE_FILE)) note_table
    (.i_note(r_note), .o_compare(o_phase_delta));
  assign o_envelope = r_envelope;
  wire [31:0] w_phase_delta;
  note_table #(.FILE(NOTE_TABLE_FILE)) note_table
    (.i_note(r_note), .o_compare(w_phase_delta));
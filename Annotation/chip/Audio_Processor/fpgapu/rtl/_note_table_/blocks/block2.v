  initial begin
    if (FILE != 0) begin
      $display("Note table file file '%s'.", FILE);
      $readmemh(FILE, note_table);
    end
  end
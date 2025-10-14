  initial begin
    if (FILE != 0) begin
      $display("Creating rom_async from init file '%s'.", FILE);
      $readmemh(FILE, memory);
    end
  end
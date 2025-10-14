  assign fifo_EF = bytes_left == 32'b0;
  assign rfifo_full = bytes_left > 7'h40;
  assign rfifo_entries = (rfifo_full) ? 7'h40 : bytes_left;
  assign rfifo_used = rfifo_entries[5 : 0];
  assign new_rom = 1'b0;
  assign num_bytes = 32'b0;
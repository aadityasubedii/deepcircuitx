`default_nettype none

module note_table #(
  parameter FILE = ""
) (
  input wire  [5:0]   i_note,
  output wire [31:0]  o_compare
);
  
  // phase delta = (FREQ_HZ / SAMPLE_HZ) * 2^32;
  reg [31:0] note_table[63:0];
  initial begin
    if (FILE != 0) begin
      $display("Note table file file '%s'.", FILE);
      $readmemh(FILE, note_table);
    end
  end
  assign o_compare = note_table[i_note];
endmodule

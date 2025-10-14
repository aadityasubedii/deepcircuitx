`default_nettype none

module rom_async #(
  parameter   WIDTH=8,
  parameter   DEPTH=256,
  parameter   FILE="",
  localparam  ADDRW=$clog2(DEPTH)
) (
  input wire  [ADDRW-1:0] addr,
  output      [WIDTH-1:0] data
);

  reg [WIDTH-1:0] memory [DEPTH];

  initial begin
    if (FILE != 0) begin
      $display("Creating rom_async from init file '%s'.", FILE);
      $readmemh(FILE, memory);
    end
  end

  assign data = memory[addr];
endmodule

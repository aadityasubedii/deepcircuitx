`default_nettype none

module sine_generator (
  input wire [31:0]   i_phase,
  output wire [8:0]   o_compare
);
  
  reg [8:0] sine_table[63:0];
  initial begin
    $readmemh("sine_table.txt", sine_table);
  end

  wire [1:0]  w_quadrant = i_phase[31:30];
  wire [5:0]  w_index = i_phase[29:24];
  wire [5:0]  w_adjusted_index = w_quadrant[0]? ~w_index : w_index;

  wire [8:0]  w_output = sine_table[w_adjusted_index];
  wire [8:0]  w_output_reflected = (w_output ^ 9'hFF) + 9'd1;
  wire [8:0]  w_adjusted_output = w_quadrant[1]? w_output_reflected : w_output;

  assign o_compare = w_adjusted_output >> 2;
endmodule

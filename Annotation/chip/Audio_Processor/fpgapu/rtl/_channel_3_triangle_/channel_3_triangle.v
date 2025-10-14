`default_nettype none

module channel_3_triangle #(
  parameter NOTE_TABLE_FILE = ""
) (
  input wire          i_clk,
  input wire          i_rst,
  input wire          i_tick_stb,
  input wire          i_note_stb,
  output wire [8:0]   o_output,
  output wire         o_frame_pulse
);
  
  wire [7:0]    w_top;
  wire          w_top_valid;
  wire [31:0]   w_phase_delta;
  wire          w_compare_valid = 1;
  channel_3_note_sequencer #(
    .NOTE_TABLE_FILE(NOTE_TABLE_FILE)
  ) sequencer (
    .i_clk(i_clk),
    .i_rst(i_rst),
    .i_tick_stb(i_tick_stb),
    .i_note_stb(i_note_stb),
    .o_top(w_top),
    .o_top_valid(w_top_valid),
    .o_phase_delta(w_phase_delta)
  );

  wire [31:0] w_phase;
  phase_generator phase_generator (
    .i_clk(i_clk),
    .i_rst(i_rst),
    .i_phase_delta(w_phase_delta),
    .i_phase_delta_valid(1'b1),
    .o_phase(w_phase),
    .o_phase_strobe()
  );

  // Generate a triangle wave
  wire [3:0]  w_triangle = w_phase[30:27];
  wire [3:0]  w_adjusted_triangle = w_phase[31] ? ~w_triangle : w_triangle;
  wire [8:0]  w_adjusted_compare = {5'b0, w_adjusted_triangle};

  assign o_output = w_adjusted_compare;
  assign o_frame_pulse = w_phase[31];

endmodule

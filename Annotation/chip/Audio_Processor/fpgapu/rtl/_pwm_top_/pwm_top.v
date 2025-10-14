`default_nettype none

module pwm_top (
  input wire  i_Clk,

  input wire  i_Switch_1,
  input wire  i_Switch_2,
  input wire  i_Switch_3,
  input wire  i_Switch_4,

  output wire io_PMOD_1,
  output wire io_PMOD_2,
  output wire io_PMOD_3
);
  wire i_clk = i_Clk;

  wire [3:0] w_switches;
  switch_synchronizers switches (
    .i_clk(i_clk),
    .i_switches({i_Switch_4, i_Switch_3, i_Switch_2, i_Switch_1}),
    .o_switches(w_switches)
  );

  wire w_rst;
  reset_generator reset_generator (
    .i_clk(i_clk),
    .o_rst(w_rst)
  );

  wire [3:0] w_mixer = ~w_switches;
  wire [8:0] w_compare;
  wire [3:0] w_frame_pulse;
  audio_processing_unit #(
    .CLOCK_FREQ(25_000_000),
    .NOTE_TABLE_FILE("resources/note_table_25MHz.txt"),
    .VIBRATO_TABLE_FILE("resources/vibrato_table_25MHz.txt"),
    .NOISE_TABLE_FILE("resources/noise_table_25MHz.txt")
  ) apu (
    .i_clk(i_clk),
    .i_rst(w_rst),
    .i_mixer(w_mixer),
    .o_sample(w_compare),
    .o_frame_pulse(w_frame_pulse)
  );

  wire w_pwm;
  wire w_cycle_end;
  pwm pwm(
    .i_clk(i_Clk),
    .i_top(8'hff),
    .i_top_valid(1'b1),
    .i_compare(w_compare),
    .i_compare_valid(1'b1),
    .o_pwm(w_pwm),
    .o_cycle_end(w_cycle_end)
  );

  assign io_PMOD_1 = w_pwm;
  assign io_PMOD_2 = w_frame_pulse[0];
  assign io_PMOD_3 = ~w_pwm;

endmodule

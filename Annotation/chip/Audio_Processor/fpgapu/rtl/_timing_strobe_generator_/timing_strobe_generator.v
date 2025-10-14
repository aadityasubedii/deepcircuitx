module timing_strobe_generator #(
  parameter CLOCK_FREQ = 25_000_000
) (
  input wire  i_clk,
  input wire  i_rst,
  output wire o_tick_stb,
  output wire o_beat_stb
);

  function integer divide_round(input integer dividend, input integer divisor);
    divide_round = (dividend + (divisor / 2)) / divisor;
  endfunction

  // localparam CLOCKS_PER_TICK = 415_667; // 25MHz / 60Hz
  // localparam CLOCKS_PER_TICK_ = (CLOCK_FREQ + (60/2))/ 60;
  localparam CLOCKS_PER_TICK_ = divide_round(CLOCK_FREQ, 60);
  // localparam CLOCKS_PER_TICK_ = CLOCK_FREQ/60;
  localparam TICK_WIDTH = $clog2(CLOCKS_PER_TICK_);
  localparam CLOCKS_PER_TICK = CLOCKS_PER_TICK_[TICK_WIDTH-1:0];

  always @* begin
    // $display("CLOCKS_PER_TICK_: %d", CLOCKS_PER_TICK_);
    $display("CLOCKS_PER_TICK: %d", CLOCKS_PER_TICK);
    $display("TICK_WIDTH: %d", TICK_WIDTH);
  end

  reg   [TICK_WIDTH-1:0]  r_tick_counter = 0;
  always @(posedge i_clk) begin
    if (i_rst) begin
      r_tick_counter <= 0;
    end else if (r_tick_counter == CLOCKS_PER_TICK-1) begin
      r_tick_counter <= 0;
    end else begin
      r_tick_counter <= r_tick_counter + 1;
    end
  end
  assign o_tick_stb = (r_tick_counter == CLOCKS_PER_TICK-1);
  
  localparam  TICKS_PER_BEAT = 5;
  localparam  BEAT_WIDTH = $clog2(TICKS_PER_BEAT);
  reg   [BEAT_WIDTH-1:0]  r_beat_counter = 0;
  always @(posedge i_clk) begin
    if (i_rst) begin
      r_beat_counter <= 0;
    end else if (o_tick_stb) begin
      if (r_beat_counter == TICKS_PER_BEAT-1) begin
        r_beat_counter <= 0;
      end else begin
        r_beat_counter <= r_beat_counter + 1;
      end
    end
  end
  assign o_beat_stb = o_tick_stb & (r_beat_counter == TICKS_PER_BEAT-1);

endmodule

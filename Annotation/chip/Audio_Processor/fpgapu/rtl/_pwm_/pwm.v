`default_nettype none

module pwm #(
  parameter RESOLUTION      = 8
) (
  input wire                    i_clk,
  input wire [RESOLUTION-1:0]   i_top,
  input wire                    i_top_valid,
  // Compare gets one more bit for glitch free 0% and 100% duty cycles
  input wire [RESOLUTION:0]     i_compare,
  input wire                    i_compare_valid,

  output wire                   o_pwm,
  output reg                    o_cycle_end
);

  // The counter, r_counter, repeatedly counts from 0 to r_top. When r_counter
  // is less than r_compare, the output is high. Otherwise the output is low.
  // r_compare needs to have one more bit than r_top to allow glitch free 0% and
  // 100% duty cycles. Without this, 100% duty cycle would be not be possible as
  // when r_top == r_compare the output is low, resulting in a single low pulse
  // at then end. The extra bit allows r_compare to be greater than r_top at
  // maximum resolution.
  //
  // For example, if the RESOLUTION is 8 bits, then the maximum number of steps
  // is 256. If r_top is 255, the maximum 8-bit value, then and r_counter will
  // count from 0 to 255. If r_compare is 0, then they duty cycle is 0% because
  // r_counter will never be less than r_top. If r_compare is 255, then the
  // output is high for 255 out of the 256 clocks. r_compare needs to be 256 (or
  // greater) for the output to be high for all 256 clocks, resulting in 100%
  // duty cycle.
  reg [RESOLUTION-1:0]  r_latched_top = 0;
  reg [RESOLUTION:0]    r_latched_compare = 0;

  reg [RESOLUTION-1:0]  r_counter = 0;
  reg [RESOLUTION-1:0]  r_top = 0;
  reg [RESOLUTION:0]    r_compare = 0;

  always @(posedge i_clk) begin
    if (i_top_valid) begin
      r_latched_top <= i_top;
    end

    if (i_compare_valid) begin
      r_latched_compare <= i_compare;
    end

    if (r_counter == r_top) begin
      r_counter <= 0;
      // Update top and compare only when the counter going to 0.
      r_top <= r_latched_top;
      r_compare <= r_latched_compare;
      o_cycle_end <= 1;
    end else begin
      r_counter <= r_counter + 1;
      o_cycle_end <= 0;
    end
  end

  assign o_pwm = ({1'b0, r_counter} < r_compare)? 1'b1 : 1'b0;
  
endmodule
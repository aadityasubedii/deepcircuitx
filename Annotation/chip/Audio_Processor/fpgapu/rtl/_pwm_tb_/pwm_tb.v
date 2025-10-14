`default_nettype none

module pwm_tb (
  input wire        i_clk,
  input wire [3:0]  i_top,
  input wire        i_top_valid,
  input wire [4:0]  i_compare,
  input wire        i_compare_valid,

  output wire       o_pwm,
  output wire       o_cycle_end
);

  pwm #(
    .RESOLUTION(4)
  )
  pwm(.*);
  
endmodule
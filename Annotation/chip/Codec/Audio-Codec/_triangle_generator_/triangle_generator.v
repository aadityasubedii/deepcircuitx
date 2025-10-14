module triangle_generator #(parameter DATA_WIDTH = 16) (
  input clk,
  input [23:0] fcw,
  output wire[(DATA_WIDTH - 1):0] triangle_wave
);
  reg [23:0] accumulator;

  assign triangle_wave = accumulator[23] == 0 ? accumulator[22:(22- DATA_WIDTH + 1)] : {DATA_WIDTH{1'b1}} - accumulator[22:(22 - DATA_WIDTH + 1)];

  always @ (posedge clk) begin
    accumulator = accumulator + fcw;
  end

endmodule

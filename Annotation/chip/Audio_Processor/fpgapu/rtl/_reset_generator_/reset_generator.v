`default_nettype none

module reset_generator #(
  parameter COUNT_WIDTH = 2
) (
  input wire    i_clk,
  output wire   o_rst
);

  reg [COUNT_WIDTH:0]   rst_count = 0;
  assign o_rst = !rst_count[COUNT_WIDTH];

  always @(posedge i_clk) begin
    if (o_rst == 1) begin
      rst_count <= rst_count + 1;
    end
  end
endmodule

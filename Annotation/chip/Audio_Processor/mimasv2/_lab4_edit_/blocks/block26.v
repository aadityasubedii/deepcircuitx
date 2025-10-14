module fir31(
  input wire clock,reset,ready,
  input wire signed [7:0] x,
  output wire signed [17:0] y,
  input wire [3:0] filtnum
);

    reg [4:0] index;
	 reg [4:0] offset;
    reg signed [7:0] sample [0:31];
	 reg signed [17:0] accum;
	 reg signed [17:0] output_reg;
	 wire signed [9:0] coeff;
	 reg done;

		assign y = output_reg;
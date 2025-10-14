module DelayModule(
input wire clock,reset,ready, 
input wire signed [7:0] x,
output wire signed [17:0] y,
input wire [3:0] filtnum
);
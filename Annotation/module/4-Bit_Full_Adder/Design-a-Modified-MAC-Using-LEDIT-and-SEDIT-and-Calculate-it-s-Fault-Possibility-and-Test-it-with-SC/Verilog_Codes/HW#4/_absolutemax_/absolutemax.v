module absolutemax ( in1, in2, in3, o );
  input [3:0] in1;
  input [3:0] in2;
  input [3:0] in3;
  output reg [3:0] o;
  reg [3:0] a1, a2, a3;
always @( in1 , in2 , in3 ) begin
  if (in1[3] == 1)
    a1 = ~in1 + 1;
  else
    a1 = in1;
  if (in2[3] == 1)
    a2 = ~in2 + 1;
  else
    a2 = in2;
  if (in3[3] == 1)
    a3 = ~in3 + 1;
  else
    a3 = in3;
  if (a2>a1)
    o = in2;
  else if (a3>a1)
    o = in3;
  else
    o = in1;
end
endmodule
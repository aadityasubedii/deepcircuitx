module full_adder(a, b, cin, s, cout);

input a, b, cin;
output s, cout;

assign s = a^b^cin;
assign cout = (a&b) | (b&cin) | (a&cin);

endmodule

module RCA(p, q, c0, r);

input [3:0] p,q;
input c0;
output [4:0] r;

wire c1,c2,c3;

full_adder fa0(p[0], q[0], c0, r[0], c1);
full_adder fa1(p[1], q[1], c1, r[1], c2);
full_adder fa2(p[2], q[2], c2, r[2], c3);
full_adder fa3(p[3], q[3], c3, r[3], r[4]);

endmodule

module full_adder(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
wire s0,c1,c2;
half_adder ha1 (a,b,s0,c1);
half_adder ha2 (s0,cin,sum,c2);
or(cout,c1,c2);
endmodule
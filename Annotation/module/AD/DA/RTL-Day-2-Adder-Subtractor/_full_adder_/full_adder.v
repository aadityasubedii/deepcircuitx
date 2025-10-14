module full_adder(a,b,cin,s,co);
input a,b,cin;
output s,co;

//Gate Level Implementation
xor(s,a,b,cin);

wire w1,w2,w3;
and(w1,a,b);
and(w2,b,cin);
and(w3,a,cin);

or(co,w1,w2,w3);

endmodule

module half_adder(a,b,s,c);
input a,b;
output s,c;

//Gate Level Implementation
xor(s,a,b); 
and(c,a,b);

endmodule

module full_subtractor(a,b,cin,d,bo);
input a,b,cin;
output d,bo;

//Gate Level Implementation
xor(d,a,b,cin);

wire w1,w2,w3;
and(w1,~a,b); 
and(w2,~b,cin);
and(w3,b,cin);

or(bo,w1,w2,w3);

endmodule

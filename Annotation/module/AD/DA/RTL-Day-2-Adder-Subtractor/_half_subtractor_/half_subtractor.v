module half_subtractor(a,b,d,bo);
input a,b;
output d,bo;

//Gate Level Implementation
xor(d,a,b);
and(bo,~a,b); 

endmodule

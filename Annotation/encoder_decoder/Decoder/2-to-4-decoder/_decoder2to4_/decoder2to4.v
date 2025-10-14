module decoder2to4(a,b,en,i0,i1,i2,i3);
input a,b,en;
output i0,i1,i2,i3;
assign i0 = (~a)&(~b)&en;
assign i1 = (~a)&(b)&en;
assign i2 = (a)&(~b)&en;
assign i3 = (a)&(b)&en;
endmodule


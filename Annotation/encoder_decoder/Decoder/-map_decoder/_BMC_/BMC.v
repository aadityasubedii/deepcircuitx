module BMC(y1,y2,L,t1,t2,t3,t4);
input signed [11:0]y1,y2;
input signed [11:0]L;
output signed [11:0]t1,t2,t3,t4;
assign t1 =  - y1 - y2 + L;
assign t2 = y1 + y2 + L;
assign t3 = y1 - y2 + L;
assign t4 = - y1 + y2 + L; 
endmodule

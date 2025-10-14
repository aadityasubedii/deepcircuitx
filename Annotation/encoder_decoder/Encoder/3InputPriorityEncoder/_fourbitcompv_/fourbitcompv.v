module sec1 (X,Y,alb);
input [3:0] X; input [2:0] Y;
output alb;
wire N0,N1,N2,P0,P1;
assign N0 = Y[2] & X[2];
assign N1 = Y[2] & Y[1];
assign N2 = Y[2] & Y[1] & Y[0];
assign P0 = N1 & X[1];
assign P1 = N2 & X[0];
assign alb = X[3] | N0 | P0 | P1;
endmodule 

module sec2 (y,z,agb);
input [3:0] z; input [2:0] y;
output agb;
wire n0,n1,n2,p0,p1;
assign n0 = y[2] & z[2];
assign n1 = y[2] & y[1];
assign n2 = y[2] & y[1] & y[0];
assign p0 = n1 & z[1];
assign p1 = n2 & z[0];
assign agb = z[3] | n0 | p0 | p1;
endmodule 

module sec3(a,b,aeb);
input[3:0] a; input[3:0] b;
output aeb;
wire r3,r2,r1,r0;
xnor(r3,a[3],b[3]);
xnor(r2,a[2],b[2]);
xnor(r1,a[1],b[1]);
xnor(r0,a[0],b[0]);
assign aeb= r3 & r2 & r1 & r0;
endmodule

module fourbitcompv(A,B,ALB,AEB,AGB);
input[3:0] A;
input[3:0] B;
output ALB,AGB,AEB;
wire[3:0] O; wire[3:0] M; wire[3:0] Q;
wire R3,R2,R1,R0;
part2(A[3],B[3],O[3],M[3],Q[3]);
part2(A[2],B[2],O[2],M[2],Q[2]);
part2(A[1],B[1],O[1],M[1],Q[1]);
part2(A[0],B[0],O[0],M[0],Q[0]);
sec1(O,M[3:1],ALB);
sec2(M[3:1],Q,AGB);
sec3(A,B,AEB);

endmodule

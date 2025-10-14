module DBSMCU(
//input clock,
input signed[11:0]i11,i15,i21,i25,i32,i36,i42,i46,i53,i57,i63,i67,i74,i78,i84,i88,db1,db2,db3,db4,db5,db6,db7,db8,
output signed [11:0]dbl1,dbl2,dbl3,dbl4,dbl5,dbl6,dbl7,dbl8);
ACS c1(i11,db1,i15,db5,dbl1);
ACS c2(i21,db1,i25,db5,dbl2);
ACS c3(i32,db2,i36,db6,dbl3);
ACS c4(i42,db2,i46,db6,dbl4);
ACS c5(i53,db3,i57,db7,dbl5);
ACS c6(i63,db4,i67,db7,dbl6);
ACS c7(i74,db4,i78,db8,dbl7);
ACS c8(i84,db4,i88,db8,dbl8);
endmodule


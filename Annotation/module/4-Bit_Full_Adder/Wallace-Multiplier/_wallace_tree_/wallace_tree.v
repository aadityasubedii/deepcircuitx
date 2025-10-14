module wallace_tree(A,B,prod);
    
    //inputs and outputs
    input [3:0] A,B;
    output [7:0] prod;
    //internal variables.
    wire s01,s02,s03,s04,s11,s12,s13,s14,s21,s22,s23,s24;
    wire c01,c02,c03,c04,c11,c12,c13,c14,c21,c22,c23,c24;
    wire [6:0] p0,p1,p2,p3;

//initialize the p's.
    assign  p0 = A & {4{B[0]}};
    assign  p1 = A & {4{B[1]}};
    assign  p2 = A & {4{B[2]}};
    assign  p3 = A & {4{B[3]}};

//final product assignments    
    assign prod[0] = p0[0];
    assign prod[1] = s01;
    assign prod[2] = s11;
    assign prod[3] = s21;
    assign prod[4] = s22;
    assign prod[5] = s23;
    assign prod[6] = s24;
    assign prod[7] = c24;

//first stage
    half_adder ha01 (p0[1],p1[0],s01,c01);
    full_adder fa02(p0[2],p1[1],p2[0],s02,c02);
    full_adder fa03(p0[3],p1[2],p2[1],s03,c03);
	half_adder ha04(p1[3],p2[2],s04,c04);

//second stage
    half_adder ha11 (c01,s02,s11,c11);
    full_adder fa12 (p3[0],c02,s03,s12,c12);
    full_adder fa13 (c03,p3[1],s04,s13,c13);
    full_adder fa14 (c04,p2[3],p3[2],s14,c14);

//third stage
    half_adder ha21(c11,s12,s21,c21);
    full_adder fa22(c12,s13,c21,s22,c22);
    full_adder fa23(c22,s14,c13,s23,c23);
    full_adder fa24(c23,p3[3],c14,s24,c24);

endmodule
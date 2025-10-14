`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2022 06:26:12
// Design Name: 
// Module Name: multi4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multi4(
    input [3:0] in1,
    input [3:0] in2,
    output [7:0] pro
    );
    
    wire a00,a01,a02,a03,a10,a11,a12,a13,a20,a21,a22,a23,a30,a31,a32,a33;
    wire c00,c01,c02,c03,c04,c05,c06,c07,c08,c09;
   
    and and1 (a00,in1[0],in2[0]);
    and and2 (a01,in1[1],in2[0]);
    and and3 (a02,in1[2],in2[0]);
    and and4 (a03,in1[3],in2[0]);
    
    
    assign a10=in1[0]&in2[1];
    assign a11=in1[1]&in2[1];
    assign a12=in1[2]&in2[1];
    assign a13=in1[3]&in2[1];
    
    assign a20=in1[0]&in2[2];
    assign a21=in1[1]&in2[2];
    assign a22=in1[2]&in2[2];
    assign a23=in1[3]&in2[2];
    
    assign a30=in1[0]&in2[3];
    assign a31=in1[1]&in2[3];
    assign a32=in1[2]&in2[3];
    assign a33=in1[3]&in2[3];
    
    assign pro[0] = a00;
    
    adder4 m1 ({a13,a12,a11,a10},{1'b0,a03,a02,a01},{c04,c03,c02,c01,c00});
    adder4 m2 ({c04,c03,c02,c01},{a23,a22,a21,a20},{c09,c08,c07,c06,c05});
    adder4 m3 ({c09,c08,c07,c06},{a33,a32,a31,a30},pro[7:3]);
    
    assign pro[1] = c00;
    assign pro[2] = c05;
endmodule

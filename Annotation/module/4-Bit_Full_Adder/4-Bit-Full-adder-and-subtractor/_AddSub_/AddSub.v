`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2022 06:45:08 PM
// Design Name: 
// Module Name: AddSub
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


module AddSub(
    input [3:0] x,
    input [3:0] y,
    input Select,
    output [3:0] Result,
    output Cout
    );
     xor(z,y[0],Select);
     Full_Adder u1 (x[0],z, Select, Result[0], C0);
     xor(z1,y[1],Select);
     Full_Adder u2 (x[1],z1, C0, Result[1], C1);
     xor(z2,y[2],Select);
     Full_Adder u3 (x[2],z2, C1, Result[2], C2);
     xor(z3,y[3],Select);
     Full_Adder u4 (x[3],z3, C2, Result[3], Cout);
endmodule

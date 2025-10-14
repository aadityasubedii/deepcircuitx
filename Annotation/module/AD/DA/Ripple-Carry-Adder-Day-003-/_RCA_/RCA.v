`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2023 02:04:07 PM
// Design Name: 
// Module Name: RCA
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


module RCA(a,b,cin,sum,carry);

        input [3:0]a,b;
        input cin;
        output [3:0]sum,carry;
        
        fa F1 (a[0],b[0],cin,sum[0],carry[0]);
        fa F2 (a[1],b[1],carry[0],sum[1],carry[1]);
        fa F3 (a[2],b[2],carry[1],sum[2],carry[2]);
        fa F4 (a[3],b[3],carry[2],sum[3],carry[3]);
        
endmodule

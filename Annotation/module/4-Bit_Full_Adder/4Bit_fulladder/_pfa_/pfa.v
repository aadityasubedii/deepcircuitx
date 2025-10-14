`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2023 23:46:09
// Design Name: 
// Module Name: pfa
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


module pfa(
input clk,
input rst,
input  [3:0]a,
input  [3:0]b,
input cin,
output  reg[3:0]sum,
output  reg[3:0]carry
    );
    reg [3:0] ar,br;
    reg c_in;
    wire [3:0] sr,cr;
    pipefulladder p1(.a(ar), .b(br), .cin(c_in), .sum(sr), .carry(cr));
    always @ (posedge clk or posedge rst) begin
    if(rst)
    begin
    ar<=4'b0000;
    br<=4'b0000;
    c_in<=1'b0;
    sum<=4'b0000;
    carry<=4'b0000;
    end
    else
    begin
    ar<=a;
    br<=b;
    c_in<=cin;
    sum<=sr;
    carry<=cr;
    end
    end

endmodule

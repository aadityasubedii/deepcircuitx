`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2016 10:02:33 AM
// Design Name: 
// Module Name: RegY
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


module RegY(
    input [3:0] ALU,
    output [3:0] RegY
    );
    
    reg [3:0] W;
    
    assign RegY = W;
 
 always @(ALU)
    begin
    
    W = ALU;
    
    end
    
    
    
endmodule

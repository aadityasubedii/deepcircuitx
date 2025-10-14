`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2016 09:40:20 AM
// Design Name: 
// Module Name: RegA
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


module RegA(
    input [3:0] sw,
    input btnC,
    input btnU,
    output [3:0] A
    );
    
    reg [3:0] Z;
    
    assign A = Z;
 
 always @(btnC or btnU)
    begin
        if(btnC == 0 && btnU == 0)
        begin
        Z = Z;
        end
        
        else if(btnC == 0 && btnU == 1)
        begin
        Z = sw;
        end
        
        else if(btnC == 1 && btnU == 0)
        begin
        Z = 4'b0000;
        end 
        
        else if(btnC == 1 && btnU == 1)
        begin
        Z = 4'b0000;
        end
    end 
endmodule
